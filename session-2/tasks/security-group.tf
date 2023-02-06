provider "aws" {
  region = "us-east-1"
}
resource "aws_security_group" "main" {
    name        = "terraformsg"
    description = "Allow ports for inbound and outbound traffic of the server"
    vpc_id      = "vpc-0e6848796d1f4ca2d"

    ingress {
        description      = "opening port for SSH connection inbound" 
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["68.129.177.23/32"]
  
    }
    ingress {
        description      = "opening HTTP port inbound" 
        from_port        = 80
        to_port          = 80
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    ingress {
        description      = "TLS from VPC inbound" 
        from_port        = 443
        to_port          = 443
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    ingress {
        description      = "TLS from VPC inbound" 
        from_port        = 3306
        to_port          = 3306
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    egress {
        description      = "Opening all ports for outbound traffic outbound" 
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}