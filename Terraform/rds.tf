#
resource "aws_db_subnet_group" "pratice_db_subnet_group" {
  name       = "pratice_db_subnet_group"
  subnet_ids = [aws_subnet.pratice_subnet_private01.id, aws_subnet.pratice_subnet_private02.id, aws_subnet.pratice_subnet_private03.id]
}

#
resource "aws_db_instance" "pratice_db" {
  db_name                = "pratice"
  allocated_storage      = 20
  storage_type           = "gp3"
  engine                 = "mysql"
  engine_version         = "8.0.33"
  instance_class         = "db.t3.micro"
  username               = "admin"
  password               = "passwd123456789"
  port                   = "3306"
  identifier             = "pratice-db-wordpress"
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.pratice_security_group_rds.id]
  db_subnet_group_name   = aws_db_subnet_group.pratice_db_subnet_group.id
}