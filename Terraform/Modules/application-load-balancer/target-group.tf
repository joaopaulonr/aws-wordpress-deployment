resource "aws_lb_target_group" "my_tg" {
  name                          = "my-tg"
  port                          = 80
  protocol                      = "HTTP"
  target_type                   = "instance"
  load_balancing_algorithm_type = "round_robin"
  vpc_id                        = var.vpc_id
}