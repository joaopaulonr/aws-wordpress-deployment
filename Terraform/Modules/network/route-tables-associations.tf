resource "aws_route_table_association" "my_public_association01" {
  subnet_id      = aws_subnet.my_subnet_public01.id
  route_table_id = aws_route_table.my_public_rt.id
}

resource "aws_route_table_association" "my_public_association02" {
  subnet_id      = aws_subnet.my_subnet_public02.id
  route_table_id = aws_route_table.my_public_rt.id
}

resource "aws_route_table_association" "my_private_association01" {
  subnet_id      = aws_subnet.my_subnet_private01.id
  route_table_id = aws_route_table.my_private_rt.id
}

resource "aws_route_table_association" "my_private_association02" {
  subnet_id      = aws_subnet.my_subnet_private02.id
  route_table_id = aws_route_table.my_private_rt.id
}