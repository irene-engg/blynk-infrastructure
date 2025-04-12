resource "aws_lb" "backend_alb" {
  name               = "backend-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.backend_alb_sg.id]
  subnets            = var.public_subnet_ids

  enable_deletion_protection = false

  tags = {
    Name = "backend-alb"
  }
}

resource "aws_lb_listener" "backend" {
  load_balancer_arn = aws_lb.backend_alb.arn
  port              = 5000
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = var.target_group_backend_arn
  }
}