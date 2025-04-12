aws_region = "ca-central-1"

vpc_cidr_block = "10.0.0.0/16"

availability_zones = ["ca-central-1a", "ca-central-1b"]

public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]

frontend_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]

backend_subnet_cidrs = ["10.0.5.0/24", "10.0.6.0/24"]

data_subnet_cidrs = ["10.0.7.0/24", "10.0.8.0/24"]

#added by Rumana
bastion_ami_id           = "ami-0cc3a9edb87c91b53"       # Replace with the correct AMI ID
bastion_instance_type    = "t2.micro"           # Override default if needed
bastion_key_name         = "capstone"        # Replace with your actual SSH key name
bastion_allowed_ssh_cidr = ["0.0.0.0/0"]   # Replace with your IP for security

ecr_repository_name = "blynk"

project_name = "blynk"

# CodePipeline variables
ecs_cluster_name = "cloud-cluster"
frontend_service_name = "frontend-service"
backend_service_name = "backend-service"