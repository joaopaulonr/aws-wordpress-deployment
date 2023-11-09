resource "aws_lb" "my_alb" {
  name               = "my-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_public]
  subnets            = [var.subnet_public_01, var.subnet_public_02]
}