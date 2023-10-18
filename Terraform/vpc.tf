#VPC
resource "aws_vpc" "pratice_vpc" {
  cidr_block = "172.21.0.0/16"
  tags = {
    Name = "pratice_vpc"
  }
}

# Subnets
resource "aws_subnet" "pratice_subnet_public01" {
  vpc_id            = aws_vpc.pratice_vpc.id
  cidr_block        = "172.21.0.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "pratice_public_subnet01"
  }
}
resource "aws_subnet" "pratice_subnet_public02" {
  vpc_id            = aws_vpc.pratice_vpc.id
  cidr_block        = "172.21.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "pratice_public_subnet02"
  }
}
resource "aws_subnet" "pratice_subnet_private01" {
  vpc_id            = aws_vpc.pratice_vpc.id
  cidr_block        = "172.21.2.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "pratice_private_subnet01"
  }
}
resource "aws_subnet" "pratice_subnet_private02" {
  vpc_id            = aws_vpc.pratice_vpc.id
  cidr_block        = "172.21.3.0/24"
  availability_zone = "us-east-1c"
  tags = {
    Name = "pratice_private_subnet02"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "pratice_igw" {
  vpc_id = aws_vpc.pratice_vpc.id
  tags = {
    Name = "pratice_igw"
  }
}

# Elastic IP
resource "aws_eip" "nat_gateway" {

}

# NAT Gateway
resource "aws_nat_gateway" "pratice_nat_gw" {
  allocation_id = aws_eip.nat_gateway.id
  subnet_id     = aws_subnet.pratice_subnet_public01.id
  tags = {
    Name = "pratice_ngw"
  }
}

# Route Tables
resource "aws_route_table" "pratice_public_rt" {
  vpc_id = aws_vpc.pratice_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.pratice_igw.id
  }
  tags = {
    Name = "pratice_public_rt"
  }
}

resource "aws_route_table" "pratice_private_rt" {
  vpc_id = aws_vpc.pratice_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.pratice_nat_gw.id
  }
  tags = {
    Name = "pratice_private_rt"
  }
}

# Route Tables Association
resource "aws_route_table_association" "pratice_public_association01" {
  subnet_id      = aws_subnet.pratice_subnet_public01.id
  route_table_id = aws_route_table.pratice_public_rt.id
}

resource "aws_route_table_association" "pratice_public_association02" {
  subnet_id      = aws_subnet.pratice_subnet_public02.id
  route_table_id = aws_route_table.pratice_public_rt.id
}

resource "aws_route_table_association" "pratice_private_association01" {
  subnet_id      = aws_subnet.pratice_subnet_private01.id
  route_table_id = aws_route_table.pratice_private_rt.id
}

resource "aws_route_table_association" "pratice_private_association02" {
  subnet_id      = aws_subnet.pratice_subnet_private02.id
  route_table_id = aws_route_table.pratice_private_rt.id
}