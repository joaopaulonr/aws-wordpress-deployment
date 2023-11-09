resource "aws_db_subnet_group" "my_db_subnet_group" {
  name       = "my_db_subnet_group"
  subnet_ids = [var.my_subnet_private01, var.my_subnet_private02]
}