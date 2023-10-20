#
output "rds_endpoint" {
  value = aws_db_instance.pratice_db.endpoint
}

output "rds_user" {
  value = aws_db_instance.pratice_db.username
}

output "rds_passwd" {
  value     = aws_db_instance.pratice_db.password
  sensitive = true
}

output "rds_name" {
  value = aws_db_instance.pratice_db.db_name
}

output "dns_name" {
  value = aws_efs_file_system.pratice_efs.dns_name
}