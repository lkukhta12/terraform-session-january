#Input Variables

variable "instance_type" {
    type = string
    description = "This is an instance type for EC2 instance"
    default = "t2.micro"
}
variable "ami" {
    type = string
    description = "AMI for the ec2 instance"
    default = "ami-0aa7d40eeae50c9a9"
}
variable "env" {
    type = string
    description = "Indicates the enviroment"
    default = "dev"
}
