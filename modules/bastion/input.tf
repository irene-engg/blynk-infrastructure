variable "vpc_id" {
  description = "The ID of the VPC where the Bastion host will be deployed"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnets where the Bastion host will be deployed"
  type        = list(string)
}

variable "ami_id" {
  description = "The AMI ID for the Bastion host"
  type        = string
}

variable "instance_type" {
  description = "The instance type for the Bastion host"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "The name of the SSH key pair for the Bastion host"
  type        = string
}

variable "allowed_ssh_cidr" {
  description = "CIDR block(s) allowed for SSH access to the Bastion Host"
  type        = list(string)
  default     = ["0.0.0.0/0"]  # Default allows all IPs, but it's recommended to restrict this
}