output "frontend_ecr_repository_url" {
  description = "The URL of the frontend ECR repository"
  value       = aws_ecr_repository.frontend_repository.repository_url
}

output "backend_ecr_repository_url" {
  description = "The URL of the backend ECR repository"
  value       = aws_ecr_repository.backend_repository.repository_url
}

output "codepipeline_name" {
  description = "The name of the CodePipeline"
  value       = aws_codepipeline.app_pipeline.name
}

output "codepipeline_bucket_name" {
  description = "The name of the S3 bucket used for CodePipeline artifacts"
  value       = aws_s3_bucket.codepipeline_bucket.bucket
} 