output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

# Added by Rumana
output "alb_arn" {
  description = "The ARN of the Application Load Balancer"
  value       = module.frontendalb.alb_arn
}

output "alb_dns_name" {
  description = "The DNS name of the Application Load Balancer"
  value       = module.frontendalb.alb_dns_name
}

output "backend_alb_dns_name" {
  description = "The DNS name of the Backend Load Balancer"
  value       = module.backendalb.backend_alb_dns_name
}

# Output for Bastion Host
output "bastion_instance_id" {
  description = "The ID of the Bastion Host instance"
  value       = module.bastion.bastion_instance_id
}

output "bastion_public_ip" {
  description = "The public IP of the Bastion Host"
  value       = module.bastion.bastion_public_ip
}

output "codepipeline_name" {
  description = "The name of the CodePipeline"
  value       = module.codepipeline.codepipeline_name
}

output "codepipeline_bucket_name" {
  description = "The name of the S3 bucket used for CodePipeline artifacts"
  value       = module.codepipeline.codepipeline_bucket_name
}

output "frontend_ecr_repository_url" {
  description = "The URL of the frontend ECR repository"
  value       = module.codepipeline.frontend_ecr_repository_url
}

output "backend_ecr_repository_url" {
  description = "The URL of the backend ECR repository"
  value       = module.codepipeline.backend_ecr_repository_url
}