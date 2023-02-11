variable "region" {
  default = "us-east-1"
}
variable "aws_vpc" {
    type = string
    description = "This is vpc name"
    default = "load-balancer-vpc"  
}

#variable "number_of_public_subnets" {
#  default = 3
#}
#variable "number_of_private_subnets" {
#  default = 3
#}




