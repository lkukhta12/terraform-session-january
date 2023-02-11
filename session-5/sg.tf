resource "aws_security_group" "main" {
    name        = "main"
    description = "Allow ports for inbound and outbound traffic of the server"
    vpc_id      = "vpc-0e6848796d1f4ca2d" # my default aws vpc id or other vpc
}