resource "aws_lb" "frontend_alb" {
  name               = "frontend-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.frontend_alb_sg.id]
  subnets            = var.public_subnet_cidrs
}

  resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.frontend_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = var.target_group_frontend_arn
  }
}



