#
resource "aws_efs_file_system" "pratice_efs" {
  creation_token   = "pratice-efs"
  performance_mode = "generalPurpose"
  encrypted        = true
  tags = {
    Name = "pratice-efs"
  }
}

#
resource "aws_efs_mount_target" "pratice_efs_mount_tg01" {
  file_system_id  = aws_efs_file_system.pratice_efs.id
  security_groups = [aws_security_group.pratice_security_group_efs.id]
  subnet_id       = aws_subnet.pratice_subnet_private01.id
}

resource "aws_efs_mount_target" "pratice_efs_mount_tg02" {
  file_system_id  = aws_efs_file_system.pratice_efs.id
  security_groups = [aws_security_group.pratice_security_group_efs.id]
  subnet_id       = aws_subnet.pratice_subnet_private02.id
}