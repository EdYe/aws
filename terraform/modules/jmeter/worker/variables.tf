variable "availability_zone" {
  description = "The availability zone of the EC2 instance"
  type        = string
}

variable "instance_name" {
  description = "The name of the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The instance type of the EC2 instance"
  type        = string
}

variable "key_name" {
  description = "The key pair name of the EC2 instance"
  type        = string
}

variable "security_group_ids" {
  description = "The security groups attached to the EC2 instance"
  type        = list(string)
}