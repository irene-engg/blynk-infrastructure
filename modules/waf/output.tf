output "waf_acl_arn" {
  description = "The ARN of the WAF Web ACL"
  value       = aws_wafv2_web_acl.waf.arn
}

output "waf_api_association" {
  description = "Association between WAF and API Gateway"
  value       = aws_wafv2_web_acl_association.waf_api_assoc.resource_arn
}