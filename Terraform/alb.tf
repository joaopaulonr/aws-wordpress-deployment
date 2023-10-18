# Application Load Balancer
resource "aws_lb" "pratice_alb" {
  name               = "pratice-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.pratice_security_group_public.id]
  subnets            = [aws_subnet.pratice_subnet_public01.id, aws_subnet.pratice_subnet_public02.id]
}

# Target Group
resource "aws_lb_target_group" "pratice_tg" {
  name                          = "pratice-tg"
  port                          = 80
  protocol                      = "HTTP"
  target_type                   = "instance"
  load_balancing_algorithm_type = "round_robin"
  vpc_id                        = aws_vpc.pratice_vpc.id
}

# alb listener
resource "aws_alb_listener" "pratice_alb_listener" {
  load_balancer_arn = aws_lb.pratice_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.pratice_tg.arn
  }
}

# Create a new ALB Target Group attachment
resource "aws_autoscaling_attachment" "pratice_attachment" {
  autoscaling_group_name = aws_autoscaling_group.pratice_asg.name
  lb_target_group_arn    = aws_lb_target_group.pratice_tg.arn
}
