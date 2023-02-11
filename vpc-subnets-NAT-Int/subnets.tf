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
resource "aws_internet_gateway" "load-balancer-ig" {
  vpc_id = aws_vpc.load-balancer-vpc
  tags = {
    Name = "VPC homework IG"
  }
}
resource "aws_route_table" "Public-Route-Table" {
  vpc_id = aws_vpc.load-balancer-vpc
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.load-balancer-ig.id}"
  }
  tags {
    Name = "Public-Route-Table"
  }
}
resource "aws_route_table_association" "public-subnets-1a-1b-1c"{
    count = 3
    subnet_id = "${aws_subnet.public-subnet.*.id}"
    route_table_id = "${aws_route_table.Public-Route-Table.id}"
}
resource "aws_route_table" "Private-Route-Table" {
  vpc_id = aws_vpc.load-balancer-vpc
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_internet_gateway.NATgateway-vpc.id}"
  }
  tags {
    Name = "Private-Route-Table"
  }
}
resource "aws_route_table_association" "Private-Route-Table-association" {
    count = 3
    subnet_id = "${aws_subnet.private-subnet.*.id}"
    route_table_id = "${aws_route_table.Private-Route-Table.id}"
 }
resource "aws_eip" "nat-aws_eip" {
   vpc   = true
}
resource ""aws_nat_gateway"" "NATgateway-vpc" {
    allocation_id = aws_eip.nat-aws_eip.id
    subnet_id = aws_subnet.public-subnet-1a.id
}