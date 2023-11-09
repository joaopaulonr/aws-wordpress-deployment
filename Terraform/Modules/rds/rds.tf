resource "aws_db_instance" "my_db" {
  db_name                = "pratice"
  allocated_storage      = 20
  storage_type           = "gp3"
  engine                 = "mysql"
  engine_version         = "8.0.33"
  instance_class         = "db.t3.micro"
  username               = "admin"
  password               = "passwd123456789"
  port                   = "3306"
  identifier             = "my-db-wordpress"
  skip_final_snapshot    = true
  vpc_security_group_ids = [var.security_group_rds]
  db_subnet_group_name   = aws_db_subnet_group.my_db_subnet_group.id
}