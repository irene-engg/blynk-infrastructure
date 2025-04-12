# Frontend ECR Repository
resource "aws_ecr_repository" "frontend_repository" {
  name = "blynk-frontend"
  force_delete = true

  image_scanning_configuration {
    scan_on_push = true
  }
}

# Backend ECR Repository
resource "aws_ecr_repository" "backend_repository" {
  name = "blynk-backend"
  force_delete = true

  image_scanning_configuration {
    scan_on_push = true
  }
}

# IAM role for CodePipeline
resource "aws_iam_role" "codepipeline_role" {
  name = "${var.project_name}-codepipeline-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "codepipeline.amazonaws.com"
        }
      }
    ]
  })
}

# IAM policy for CodePipeline
resource "aws_iam_role_policy" "codepipeline_policy" {
  role = aws_iam_role.codepipeline_role.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:GetObjectVersion",
          "s3:GetBucketVersioning",
          "s3:PutObject",
          "s3:ListBucket",
          "s3:ListBucketVersions"
        ]
        Resource = [
          aws_s3_bucket.codepipeline_bucket.arn,
          "${aws_s3_bucket.codepipeline_bucket.arn}/*"
        ]
      },
      {
        Effect = "Allow"
        Action = [
          "ecs:DescribeServices",
          "ecs:DescribeTaskDefinition",
          "ecs:DescribeTasks",
          "ecs:ListTasks",
          "ecs:RegisterTaskDefinition",
          "ecs:UpdateService"
        ],
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
          "ecr:DescribeImages",
          "ecr:GetAuthorizationToken",
          "ecr:BatchCheckLayerAvailability",
          "ecr:BatchGetImage",
          "ecr:GetDownloadUrlForLayer"
        ],
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
          "iam:PassRole"
        ],
        Resource = "*"
      }
    ]
  })
}

# S3 bucket for CodePipeline artifacts
resource "aws_s3_bucket" "codepipeline_bucket" {
  bucket = "${var.project_name}-codepipeline-artifacts"
}

resource "aws_s3_bucket_versioning" "codepipeline_bucket_versioning" {
  bucket = aws_s3_bucket.codepipeline_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_ownership_controls" "codepipeline_bucket_ownership" {
  bucket = aws_s3_bucket.codepipeline_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "codepipeline_bucket_access" {
  bucket = aws_s3_bucket.codepipeline_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "codepipeline_bucket_policy" {
  bucket = aws_s3_bucket.codepipeline_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = aws_iam_role.codepipeline_role.arn
        }
        Action = [
          "s3:GetObject",
          "s3:GetObjectVersion",
          "s3:GetBucketVersioning",
          "s3:PutObject",
          "s3:ListBucket"
        ]
        Resource = [
          aws_s3_bucket.codepipeline_bucket.arn,
          "${aws_s3_bucket.codepipeline_bucket.arn}/*"
        ]
      }
    ]
  })
}

# CodePipeline
resource "aws_codepipeline" "app_pipeline" {
  name     = "${var.project_name}-pipeline"
  role_arn = aws_iam_role.codepipeline_role.arn

  artifact_store {
    location = aws_s3_bucket.codepipeline_bucket.bucket
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "S3"
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        S3Bucket = aws_s3_bucket.codepipeline_bucket.bucket
        S3ObjectKey = "source.zip"
        PollForSourceChanges = true
      }
    }
  }

  stage {
    name = "Deploy"

    action {
      name            = "FrontendDeploy"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "ECS"
      version         = "1"
      input_artifacts = ["source_output"]

      configuration = {
        ClusterName = var.ecs_cluster_name
        ServiceName = var.frontend_service_name
        FileName    = "frontend-imagedefinitions.json"
      }
    }

    action {
      name            = "BackendDeploy"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "ECS"
      version         = "1"
      input_artifacts = ["source_output"]

      configuration = {
        ClusterName = var.ecs_cluster_name
        ServiceName = var.backend_service_name
        FileName    = "backend-imagedefinitions.json"
      }
    }
  }
} 