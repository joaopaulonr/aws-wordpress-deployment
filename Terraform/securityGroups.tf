resource "aws_security_group" "pratice_security_group_bastion" {
  name        = "allow_Protocols_bastion"
  description = "Allow traffic"
  vpc_id      = aws_vpc.pratice_vpc.id
  ingress {
    description = "Regra SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Regra ICMP"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "pratice_group_bastion"
  }
}

resource "aws_security_group" "pratice_security_group_public" {
  name        = "allow_Protocols"
  description = "Allow traffic"
  vpc_id      = aws_vpc.pratice_vpc.id
  ingress {
    description = "Regra SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["172.21.0.0/24"]
  }
  ingress {
    description = "Regra ICMP"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Regra HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "pratice_group_public"
  }
}

resource "aws_security_group" "pratice_security_group_private" {
  name        = "allow_Protocols_Private"
  description = "Allow traffic"
  vpc_id      = aws_vpc.pratice_vpc.id
  ingress {
    description = "Regra SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["172.21.0.0/24"]
  }
  ingress {
    description = "Regra ICMP"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["172.21.0.0/16"]
  }
    ingress {
    description = "Regra HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "pratice_group_private"
  }
}