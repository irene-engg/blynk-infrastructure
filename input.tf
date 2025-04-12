variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  }

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  }

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
  }

variable "frontend_subnet_cidrs" {
  description = "List of CIDR blocks for frontend subnets"
  type        = list(string)
  }

variable "backend_subnet_cidrs" {
  description = "List of CIDR blocks for backend subnets"
  type        = list(string)
  }

variable "data_subnet_cidrs" {
  description = "List of CIDR blocks for data subnets"
  type        = list(string)
  }

# Bastion-specific variables
variable "bastion_ami_id" {
  description = "AMI ID for the Bastion Host"
  type        = string
}

variable "bastion_instance_type" {
  description = "Instance type for the Bastion Host"
  default     = "t2.micro"
}

variable "bastion_key_name" {
  description = "SSH key pair for Bastion Host"
  type        = string
}

variable "bastion_allowed_ssh_cidr" {
  description = "CIDR blocks allowed to SSH into Bastion Host"
  type        = list(string)
  default     = ["0.0.0.0/0"]  # Restrict to your IP for security
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "ecr_repository_name" {
  description = "Name of the ECR repository"
  type        = string
}

variable "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
}

variable "frontend_service_name" {
  description = "Name of the frontend ECS service"
  type        = string
}

variable "backend_service_name" {
  description = "Name of the backend ECS service"
  type        = string
}