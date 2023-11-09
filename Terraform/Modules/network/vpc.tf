resource "aws_vpc" "my_vpc" {
  cidr_block = "172.21.0.0/16"
  tags = {
    Name = "my_vpc"
  }
  enable_dns_hostnames = true
  enable_dns_support = true
}