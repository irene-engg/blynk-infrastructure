variable "waf_name" {
  description = "The name of the WAF Web ACL"
  type        = string
}

variable "api_gateway_stage_arn" {  # Using Stage ARN instead of API ARN
  description = "The ARN of the API Gateway Stage"
  type        = string
}