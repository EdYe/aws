terraform {
  backend "s3" {
    # Replace this with your folder path
    key            = "users/UPI_TAIWAN_OFFSHORE/edward/terraform/live/edward/develop/terraform.tfstate"
    bucket         = "cobalt-chc-dev-dataplatform"
    region         = "us-east-1"
    dynamodb_table = "Cobalt-UPI-Terraform-Locks"
    encrypt        = "true"
  }
}

provider "aws" {
  region = "us-east-1"
}

module "develop" {
  source = "../../../modules/ec2"

  availability_zone  = "us-east-1b"
  instance_name      = var.tag_name
  instance_type      = "c5.2xlarge"
  key_name           = "edward.yeh"
  security_group_ids = [
    aws_security_group.ihdp_upi_qa_edward.id
  ]
  user_data          = file("user-data.sh")
  root_volume_size   = 16
}

resource "aws_volume_attachment" "new_disk" {
  device_name = "/dev/sdf"
  instance_id = module.develop.instance_id
  volume_id   = "vol-024130101924dd25b"
}

resource "aws_security_group" "ihdp_upi_qa_edward" {
  name        = var.tag_name
  description = "Allow SSH inbound traffic"
  vpc_id      = "vpc-42f90f24"

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow All"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.tag_name
  }
}
