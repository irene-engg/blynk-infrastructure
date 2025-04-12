resource "aws_security_group" "frontend_sg" {
  name        = "frontend_sg"
  description = "Allow inbound traffic to Frontend Fargate Service"
  vpc_id      = var.vpc_id

  tags = {
    Name = "frontend-ecs-sg"
  }
}

resource "aws_security_group_rule" "frontend_ingress" {
  security_group_id        = aws_security_group.frontend_sg.id
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = var.frontend_alb_sg_id
  description              = "Allow traffic from Frontend ALB"
}

resource "aws_security_group_rule" "frontend_egress" {
  security_group_id = aws_security_group.frontend_sg.id
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Allow all outbound traffic"
}

resource "aws_security_group" "backend_sg" {
  name_prefix  = "backend-sg-"
  description  = "Allow inbound traffic to Backend Fargate Service"
  vpc_id       = var.vpc_id

  tags = {
    Name = "backend-ecs-sg"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group_rule" "backend_ingress" {
  security_group_id        = aws_security_group.backend_sg.id
  type                     = "ingress"
  from_port                = 5000
  to_port                  = 5000
  protocol                 = "tcp"
  source_security_group_id = var.backend_alb_sg_id
  description              = "Allow traffic from Backend ALB"
}

resource "aws_security_group_rule" "backend_egress" {
  security_group_id = aws_security_group.backend_sg.id
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Allow all outbound traffic"
}
