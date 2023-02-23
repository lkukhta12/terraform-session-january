resource "aws_security_group" "main" {
    name        = "${var.env}-sg"
    description = "Allow ports for inbound and outbound traffic of the server"
}
    ingress {
        description      = "opening port for SSH connection inbound" 
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["68.129.177.23/32"]
        }
    egress {
        description      = "Opening all ports for outbound traffic outbound" 
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    }