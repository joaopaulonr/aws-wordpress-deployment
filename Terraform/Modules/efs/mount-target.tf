resource "aws_efs_mount_target" "my_efs_mount_tg01" {
  file_system_id  = aws_efs_file_system.my_efs.id
  security_groups = [var.security_group_efs]
  subnet_id       = var.my_subnet_private01
}

resource "aws_efs_mount_target" "my_efs_mount_tg02" {
  file_system_id  = aws_efs_file_system.my_efs.id
  security_groups = [var.security_group_efs]
  subnet_id       = var.my_subnet_private02
}