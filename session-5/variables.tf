#Input Variables

variable "instance_type" {
    type = string
    description = "This is an instance type for EC2 instance"
    default = "t2.micro"
}
variable "env" {
    type = string
    description = "Indicates the enviroment"
    default = "dev"
}
variable "ports" {
    type = list(string)
    description = "List ports"
    default = [ "22" , "80", "3306" ]
}
