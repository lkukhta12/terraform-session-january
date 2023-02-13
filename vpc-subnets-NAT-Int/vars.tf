variable "region" {
  default = "us-east-1"
}
variable "aws_vpc" {
    type = string
    description = "This is vpc name"
    default = "load-balancer-vpc"  
}

