resource "aws_internet_gateway" "load-balancer-ig" {
  vpc_id = aws_vpc.load-balancer-vpc
  tags = {
    Name = "load-balancer-ig"
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
    nat_gateway_id = aws_nat_internet_gateway.NATgateway-vpc.id
  }
  tags {
    Name = "Private-Route-Table"
  }
}
resource "aws_route_table_association" "Private-Route-Table-association" {
    count = 3
    subnet_id = "${aws_subnet.private-subnet.*.id}"
    route_table_id = aws_route_table.Private-Route-Table.id
 }
resource "aws_eip" "NATgateway-vpc" {
   vpc   = true
}
resource "aws_nat_gateway" "NATgateway-vpc" {
    connectivity_type = "public"
    allocation_id = aws_eip.NATgateway-vpc.id
    subnet_id = aws_subnet.public-subnet-1a.NATgateway-vpc_id
}