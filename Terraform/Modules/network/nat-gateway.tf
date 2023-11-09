resource "aws_eip" "ip_nat_gateway" {
  #IP elástico para o nat gateway
}

resource "aws_nat_gateway" "my_nat_gw" {
  allocation_id = aws_eip.ip_nat_gateway.id
  subnet_id     = aws_subnet.my_subnet_public01.id
  tags = {
    Name = "my_ngw"
  }
}