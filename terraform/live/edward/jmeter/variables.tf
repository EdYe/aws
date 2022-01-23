variable "worker_names" {
  description = "The list of the name of the worker"
  type        = set(string)
  default     = [
    "ihdp-upi-jmeter-worker01-edward",
    "ihdp-upi-jmeter-worker02-edward",
    "ihdp-upi-jmeter-worker03-edward",
    "ihdp-upi-jmeter-worker04-edward",
    "ihdp-upi-jmeter-worker05-edward"
  ]
}

variable "availability_zone" {
  description = "The availability zone of the EC2 instance"
  type        = string
  default     = "us-east-1b"
}

variable "instance_type" {
  description = "The instance type of the EC2 instance"
  type        = string
  default     = "t3a.medium"
}

variable "key_name" {
  description = "The key pair name of the EC2 instance"
  type        = string
  default     = "edward.yeh"
}

variable "security_group_name" {
  description = "The name of the security group"
  type        = string
  default     = "ihdp_upi_jmeter_edward"
}