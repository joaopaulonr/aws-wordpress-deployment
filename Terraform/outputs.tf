output "rds_endpoint" {
  value = aws_db_instance.pratice_db.endpoint
}

output "rds_user" {
  value = aws_db_instance.pratice_db.username
}

output "rds_passwd" {
  value = aws_db_instance.pratice_db.password
}

output "rds_name" {
  value = aws_db_instance.pratice_db.db_name
}