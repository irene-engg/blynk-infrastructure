output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.vpc_blynk.id
}

output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = [aws_subnet.public_subnet1.id, aws_subnet.public_subnet2.id]
}

output "frontend_subnet1" {
  description = "Frontend subnet 1 ID"
  value       = aws_subnet.frontend_subnet1.id
}

output "frontend_subnet2" {
  description = "Frontend subnet 2 ID"
  value       = aws_subnet.frontend_subnet2.id
}

output "backend_subnet_ids" {
  description = "List of public subnet IDs"
  value       = [aws_subnet.backend_subnet1.id, aws_subnet.backend_subnet2.id]
}

output "backend_subnet1" {
  description = "Backend subnet 1 ID"
  value       = aws_subnet.backend_subnet1.id
}

output "backend_subnet2" {
  description = "Backend subnet 2 ID"
  value       = aws_subnet.backend_subnet2.id
}


