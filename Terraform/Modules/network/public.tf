resource "aws_subnet" "my_subnet_public01" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.21.0.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "my_public_subnet01"
  }
}

resource "aws_subnet" "my_subnet_public02" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.21.1.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "my_public_subnet02"
  }
}