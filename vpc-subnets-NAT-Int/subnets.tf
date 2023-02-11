# Creating 6 subnets: 3 public and 3 private with following CIDR blcoks in us-east-1 region

resource "aws_subnet" "public-subnet-1a" {
  vpc_id = aws_vpc.load-balancer-vpc.id
  map_public_ip_on_launch = "true" # true makes subnet public
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "public-subnet-1a"
  }
}
resource "aws_subnet" "public-subnet-1b" {
  vpc_id = aws_vpc.load-balancer-vpc.id
  map_public_ip_on_launch = "true" # true makes subnet public
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "public-subnet-1b"
  }
}
resource "aws_subnet" "public-subnet-1c" {
  vpc_id = aws_vpc.load-balancer-vpc.id
  map_public_ip_on_launch = "true" # true makes subnet public
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1c"
  tags = {
    Name = "public-subnet-1c"
  }
}
resource "aws_subnet" "private-subnet-1a" {
  vpc_id = aws_vpc.load-balancer-vpc.id
  cidr_block = "10.0.11.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "private-subnet-1a"
  }
}
resource "aws_subnet" "private-subnet-1b" {
  vpc_id = aws_vpc.load-balancer-vpc.id
  cidr_block = "10.0.12.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "private-subnet-1b"
  }
}
resource "aws_subnet" "private-subnet-1c" {
  vpc_id = aws_vpc.load-balancer-vpc.id
  cidr_block = "10.0.13.0/24"
  availability_zone = "us-east-1c"
  tags = {
    Name = "private-subnet-1c"
  }
}
