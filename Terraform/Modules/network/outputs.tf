output "vpc_id" {
    value = aws_vpc.my_vpc.id
}

output "subnet-public-01" {
  value = aws_subnet.my_subnet_public01.id
}

output "subnet-public-02" {
  value = aws_subnet.my_subnet_public02.id
}

output "subnet-private-01" {
  value = aws_subnet.my_subnet_private01.id
}

output "subnet-private-02" {
  value = aws_subnet.my_subnet_private02.id
}

output "internet-gateway" {
  value = aws_internet_gateway.my_igw.id
}