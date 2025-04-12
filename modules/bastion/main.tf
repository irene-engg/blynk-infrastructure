resource "aws_instance" "bastion" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_ids[0]  # Use the first subnet ID from the list

  vpc_security_group_ids = [aws_security_group.bastion_sg.id]

  key_name = var.key_name  # Add this line to associate the key pair

  tags = {
    Name = "Bastion-Host"
  }
}