resource "aws_security_group" "backend_alb_sg" {
  name_prefix  = "backend-alb-sg-"
  description = "Allow traffic to Backend ALB"
  vpc_id      = var.vpc_id

  tags = {
    Name = "backend-alb-sg"
  }
  
  lifecycle {
    create_before_destroy = true
  }
}

# Allow traffic from frontend ECS service
resource "aws_security_group_rule" "backend_alb_from_frontend" {
  security_group_id        = aws_security_group.backend_alb_sg.id
  type                     = "ingress"
  from_port                = 5000
  to_port                  = 5000
  protocol                 = "tcp"
  source_security_group_id = var.frontend_ecs_sg_id
  description              = "Allow traffic from frontend ECS service"
}

# Allow HTTP traffic from internet on port 5000
resource "aws_security_group_rule" "backend_alb_from_internet" {
  security_group_id = aws_security_group.backend_alb_sg.id
  type              = "ingress"
  from_port         = 5000
  to_port           = 5000
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Allow public access to backend API"
}

# Allow all outbound traffic
resource "aws_security_group_rule" "backend_alb_egress" {
  security_group_id = aws_security_group.backend_alb_sg.id
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Allow all outbound traffic"
}
