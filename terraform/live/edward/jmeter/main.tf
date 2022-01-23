terraform {
  backend "s3" {
    # Replace this with your folder path
    key            = "users/UPI_TAIWAN_OFFSHORE/edward/terraform/live/edward/jmeter/terraform.tfstate"
    bucket         = "cobalt-chc-dev-dataplatform"
    region         = "us-east-1"
    dynamodb_table = "Cobalt-UPI-Terraform-Locks"
    encrypt        = "true"
  }
}

provider "aws" {
  region = "us-east-1"
}

module "jmeter_controller" {
  source = "../../../modules/jmeter/controller"

  availability_zone  = var.availability_zone
  instance_name      = "ihdp_upi_jmeter_controller_edward"
  instance_type      = var.instance_type
  key_name           = var.key_name
  security_group_ids = [
    aws_security_group.ihdp_upi_jmeter_edward.id
  ]
}

module "jmeter_worker" {
  for_each = var.worker_names

  source = "../../../modules/jmeter/worker"

  availability_zone  = var.availability_zone
  instance_name      = each.value
  instance_type      = var.instance_type
  key_name           = var.key_name
  security_group_ids = [
    aws_security_group.ihdp_upi_jmeter_edward.id
  ]
}

resource "aws_security_group" "ihdp_upi_jmeter_edward" {
  name        = var.security_group_name
  description = "For JMeter cluster"
  vpc_id      = "sg-0579a0c53de7c77e4"

  ingress {
    description = "Allow All"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
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
    Name = var.security_group_name
  }
}