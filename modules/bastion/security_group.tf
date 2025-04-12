resource "aws_security_group" "bastion_sg" {
  vpc_id = var.vpc_id

  # Allow SSH access from a restricted IP range
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ssh_cidr  # Use the passed variable
  }

  # Allow outbound traffic to all destinations
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "bastion-sg"
  }
}