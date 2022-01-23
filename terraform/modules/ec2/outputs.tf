output "instance_id" {
  description = "The EC2 instance ID"
  value = aws_instance.ec2.id
}