# Creating VPC 

resource "aws_vpc" "load-balancer-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = aws_vpc.load-balancer-vpc
}

#Task:
#1. Create a VPC with CIDR Block of 10.0.0.0/16
#2. Create 3 public subnets and 3 private subnets
#3. Create Internet and Nat Gateway
#4. Create Public and Private Route Tables
#   - associate all the subnets 
#   - add internet and nat gateway as routes 