output "backend_alb_sg_id" {
  description = "Id of Backend Security group"
  value       = aws_security_group.backend_alb_sg.id
}

output "backend_listener_id" {
  description = "Id of Listener"
  value       = aws_lb_listener.backend.id
}

output "backend_listener_arn" {
  description = "ARN of the backend ALB listener"
  value       = aws_lb_listener.backend.arn
}

output "backend_alb_dns_name" {
  description = "The DNS name of the backend ALB"
  value       = aws_lb.backend_alb.dns_name
}