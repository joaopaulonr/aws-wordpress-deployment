resource "aws_efs_file_system" "my_efs" {
  creation_token   = "my-efs"
  performance_mode = "generalPurpose"
  encrypted        = true
  tags = {
    Name = "my-efs"
  }
}