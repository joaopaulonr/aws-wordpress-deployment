resource "aws_autoscaling_group" "my_asg" {
  name = "my-asg"
  min_size                  = 2
  max_size                  = 6
  desired_capacity          = 2
  health_check_grace_period = 150
  health_check_type         = "EC2"

  launch_template {
    id = aws_launch_template.my_template.id
  }
  vpc_zone_identifier = [var.my_subnet_private01,var.my_subnet_private02]
}
