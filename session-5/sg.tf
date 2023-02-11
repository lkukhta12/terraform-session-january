resource "aws_security_group" "main" {
    name        = "main"
    description = "Allow ports for inbound and outbound traffic of the server"
    vpc_id      = "vpc-0e6848796d1f4ca2d" # my default aws vpc id or other vpc
}
resource "aws_security_group_rule" "ingress" {
  count = 2 # to open 2 ports from variables file
  type              = "ingress"
  to_port           = element( var.ports, count.index ) # port 22
  from_port         = element( var.ports, count.index ) # port 22
  security_group_id = aws_security_group.main.id
  protocol          = "tcp"
  cidr_blocks      = ["68.129.177.23/32"]
}
resource "aws_security_group_rule" "egress" {
  type              = "egress"
  to_port           = 0
  protocol          = "-1"
  from_port         = 0
  security_group_id = aws_security_group.main.id
  cidr_blocks      = ["0.0.0.0/0"]
}  
# element(var.port, 0)
#count = 2
#count.index = 0, 1

#count = 5
#count.index = 0, 2, 3, 4