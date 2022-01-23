data "aws_ssm_parameter" "ami" {
  name = "/nimbus/gold/linux/amazon-2"
}

resource "aws_instance" "ec2" {
  ami                    = data.aws_ssm_parameter.ami.value
  availability_zone      = var.availability_zone
  credit_specification {
    cpu_credits = "unlimited"
  }
  iam_instance_profile   = "Cobalt-EmrEc2Default"
  instance_type          = var.instance_type
  key_name               = var.key_name
  monitoring             = true
  source_dest_check      = true
  subnet_id              = "subnet-cbc9ab82"
  tags                   = {
    APP_ID        = "1914"
    BUSINESS_AREA = "Healthcare App"
    Billing       = "Dataplatform/UPI"
    COST_CENTER   = "40144"
    Name          = var.instance_name
  }
  tenancy                = "default"
  user_data              = var.user_data
  vpc_security_group_ids = var.security_group_ids
  root_block_device {
    volume_size = var.root_volume_size
  }
}