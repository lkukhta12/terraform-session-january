variable "env" {
    type = string
    description = "Indicates the enviroment"
    default = "dev"
}
variable "ami" {
    type = string
    description = "This is image AMI for ec2"
    default = ""
}
variable "instance_type" {
    type = string
    description = "This is an instance size for EC2 instance"
    default = "t2.micro"
}
variable "sg" {
    type = list(string)
    description = "List of security group ids"
    default = [""]
}