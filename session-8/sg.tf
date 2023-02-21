resource "aws_security_group" "main" {
    name        = "main"
    description = "Allow ports for inbound and outbound traffic of the server"
    vpc_id      = "vpc-0e6848796d1f4ca2d" # my default aws vpc id or other vpc

    ingress {
        description      = "opening port for SSH connection inbound" 
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["52.203.138.0/32"]
    }
        ingress {
        description      = "opening port for SSH connection inbound" 
        from_port        = 80
        to_port          = 80
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }
    egress {
        description      = "Opening all ports for outbound traffic outbound" 
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    }
}