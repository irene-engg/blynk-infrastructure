variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

#variable "private_subnets" {
  #description = "List of private subnets"
  #type        = list(string)
#}

variable "frontend_subnet1" {
  description = "Front end private subnet1"
  type        = string
}

variable "frontend_subnet2" {
  description = "Front end private subnet2"
  type        = string
}

variable "backend_subnet1" {
  description = "Back end private subnet1"
  type        = string
}

variable "backend_subnet2" {
  description = "Back end private subnet2"
  type        = string
}

variable "target_group_frontend_arn" {
   description = "ARN of the front end target group"
  }

  variable "frontend_alb_sg_id" {
  description = "The security group ID of the ALB"
  type        = string
}

variable "target_group_backend_arn" {
   description = "ARN of the back end target group"
  }
  
variable "backend_alb_sg_id" {
   description = "Id of backend ALB SG"
  }

variable "backend_listener_id" {
   description = "Id of backend Listener"
  }
