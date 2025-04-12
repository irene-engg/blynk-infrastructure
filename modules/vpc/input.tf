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




