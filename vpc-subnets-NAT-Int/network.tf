resource "aws_eip" "eip-NATgateway" {
   vpc   = true
   tags = {
    Name = "eip"
   }
}
resource "aws_nat_gateway" "NATgateway-vpc" {
    connectivity_type = "public"
    allocation_id = aws_eip.eip-NATgateway.id
    subnet_id = aws_subnet.public-subnet-1a.id
    tags = {
      Name = "Nat Gateway"
    }
}
resource "aws_internet_gateway" "load-balancer-ig" {
  vpc_id = aws_vpc.load-balancer-vpc.id
  tags = {
    Name = "load-balancer-ig"
  }
}

# Routing Tables

resource "aws_route_table" "Public-Route-Table" {
  vpc_id = aws_vpc.load-balancer-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.load-balancer-ig.id
  }
  tags = {
    Name = "Public-Route-Table"
  }
}
resource "aws_route_table_association" "public-subnets-1a"{
    subnet_id = aws_subnet.public-subnet-1a.id
    route_table_id = aws_route_table.Public-Route-Table.id
}
resource "aws_route_table_association" "public-subnets-1b"{
    subnet_id = aws_subnet.public-subnet-1b.id
    route_table_id = aws_route_table.Public-Route-Table.id
}
resource "aws_route_table_association" "public-subnets-1c"{
    subnet_id = aws_subnet.public-subnet-1c.id
    route_table_id = aws_route_table.Public-Route-Table.id
}
#Private Route Table
resource "aws_route_table" "Private-Route-Table" {
  vpc_id = aws_vpc.load-balancer-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.NATgateway-vpc.id
  }
  tags = {
    Name = "Private-Route-Table"
  }
}
resource "aws_route_table_association" "private-subnet-1a" {
    subnet_id = aws_subnet.private-subnet-1a.id
    route_table_id = aws_route_table.Private-Route-Table.id
 }
resource "aws_route_table_association" "private-subnet-1b" {
    subnet_id = aws_subnet.private-subnet-1b.id
    route_table_id = aws_route_table.Private-Route-Table.id
 }
 resource "aws_route_table_association" "private-subnet-1c" {
    subnet_id = aws_subnet.private-subnet-1c.id
    route_table_id = aws_route_table.Private-Route-Table.id
 }