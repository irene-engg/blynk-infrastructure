variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
  }

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "target_group_frontend_arn" {
   description = "ARN of the front end target group"
  }

