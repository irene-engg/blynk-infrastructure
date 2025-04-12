output "frontend_ecs_arn" {
  description = "ARN of the Frontend ECS Service"
  value       = aws_ecs_service.frontend_service.id
}

output "backend_ecs_arn" {
  description = "ARN of the Backend ECS Service"
  value       = aws_ecs_service.backend_service.id
}

output "frontend_ecs_sg_id" {
  description = "Security group ID for frontend ECS service"
  value       = aws_security_group.frontend_sg.id
}
