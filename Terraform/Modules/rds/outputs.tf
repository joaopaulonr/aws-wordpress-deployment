output "rds_endpoint" {
  value = aws_db_instance.my_db.endpoint
}

output "rds_user" {
  value = aws_db_instance.my_db.username
}

output "rds_passwd" {
  value     = aws_db_instance.my_db.password
  sensitive = true
}

output "rds_name" {
  value = aws_db_instance.my_db.db_name
}