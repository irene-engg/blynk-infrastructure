output "bastion_instance_id" {
  description = "The ID of the Bastion Host instance"
  value       = aws_instance.bastion.id
}

output "bastion_public_ip" {
  description = "Public IP of the Bastion Host"
  value       = aws_instance.bastion.public_ip
}