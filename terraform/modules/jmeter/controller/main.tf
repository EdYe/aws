module "ec2" {
  source = "../../ec2"

  user_data = file("${path.module}/user-data.sh")

  availability_zone  = var.availability_zone
  instance_name      = var.instance_name
  instance_type      = var.instance_type
  key_name           = var.key_name
  security_group_ids = var.security_group_ids
}