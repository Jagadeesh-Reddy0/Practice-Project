provider "aws" {
  profile = "default"
  region  = "ap-south-1"
}

resource "aws_vpc" "test_vpc" {
  cidr_block = "10.1.0.0/16"

  tags = {
    Name = "TEST VPC"
  }
}

resource "aws_subnet_private" "test_public_subnet" {
  vpc_id            = aws_vpc.test_vpc.id
  cidr_block        = "10.1.0.0/17"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "Test Public Subnet"
  }
}

resource "aws_subnet" "test_private_subnet" {
  vpc_id            = aws_vpc.test_vpc.id
  cidr_block        = "10.1.128.0/17"
  availability_zone = "ap-south-1b"

  tags = {
    Name = "Test Private Subnet"
  }
}

resource "aws_internet_gateway" "test_ig" {
  vpc_id = aws_vpc.test_vpc.id

  tags = {
    Name = "Test Internet Gateway"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.test_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test_ig.id
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id = aws_internet_gateway.test_ig.id
  }

  tags = {
    Name = "Public Route Table"
  }
}

resource "aws_route_table_association" "public_1_rt_a" {
  subnet_id      = aws_subnet.test_public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_security_group" "web_sg" {
  name   = "HTTP and SSH"
  vpc_id = aws_vpc.test_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web_instance" {
  ami           = "ami-0ef82eeba2c7a0eeb"
  instance_type = "t2.micro"
  key_name      = "rg_Mumbai"

  subnet_id                   = aws_subnet.some_public_subnet.id
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  associate_public_ip_address = true


  tags = {
    "Name" : "server"
  }
}
