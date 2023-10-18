# Model da Instância
resource "aws_launch_template" "pratice_template" {
  image_id      = var.ami
  instance_type = var.instance_type
  user_data     = filebase64("../Scripts/docker_install.sh")

  block_device_mappings {
    device_name = "/dev/sdf"

    ebs {
      volume_type = var.volume_type
      volume_size = var.volume_size
    }
  }

  network_interfaces {
    associate_public_ip_address = false
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
}