output "target_group_frontend_arn" {
  description = "ARN of the frontend target group"
  value       = aws_lb_target_group.frontend_tg.arn
}

output "target_group_backend_arn" {
  description = "ARN of the backend target group"
  value       = aws_lb_target_group.backend_tg.arn
}

output "frontend_tg_name" {
  description = "Name of the frontend target group"
  value       = aws_lb_target_group.frontend_tg.name
}

output "backend_tg_name" {
  description = "Name of the backend target group"
  value       = aws_lb_target_group.backend_tg.name
}
