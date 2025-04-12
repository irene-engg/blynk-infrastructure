output "alb_arn" {
  description = "ARN of the frontend ALB"
  value       = aws_lb.frontend_alb.arn
}

output "frontend_alb_sg_id" {
  description = "ID of the frontend ALB security group"
  value       = aws_security_group.frontend_alb_sg.id
}

#Added by rumana
output "alb_dns_name" {
  description = "DNS name of the frontend ALB"
  value       = aws_lb.frontend_alb.dns_name
}

output "frontend_listener_arn" {
  description = "ARN of the frontend ALB listener"
  value       = aws_lb_listener.http.arn
}
