resource "aws_autoscaling_attachment" "my_attachment" {
  autoscaling_group_name = var.asg_name
  lb_target_group_arn    = aws_lb_target_group.my_tg.arn
}