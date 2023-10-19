# Model da Instância
resource "aws_launch_template" "pratice_template" {
  name_prefix            = "pratice_template"
  description            = "modelo de instância"
  image_id               = var.ami
  instance_type          = var.instance_type
  user_data              = filebase64("../Scripts/docker_install.sh")
  vpc_security_group_ids = [aws_security_group.pratice_security_group_private.id]
  key_name               = var.key_name

  block_device_mappings {
    device_name = "/dev/sdf"

    ebs {
      volume_type = var.volume_type
      volume_size = var.volume_size
    }
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name       = "docker-wordpress"
      Project    = "PB UFC"
      CostCenter = "C092000004"
    }
  }
  tag_specifications {
    resource_type = "volume"
    tags = {
      Name       = "docker-wordpress"
      Project    = "PB UFC"
      CostCenter = "C092000004"
    }
  }
  depends_on = [aws_security_group.pratice_security_group_private]
}

# Auto scaling Group
resource "aws_autoscaling_group" "pratice_asg" {
  min_size                  = 2
  max_size                  = 8
  desired_capacity          = 2
  health_check_grace_period = 300
  health_check_type         = "EC2"

  launch_template {
    id = aws_launch_template.pratice_template.id
  }
  vpc_zone_identifier = [aws_subnet.pratice_subnet_private01.id, aws_subnet.pratice_subnet_private02.id]
}