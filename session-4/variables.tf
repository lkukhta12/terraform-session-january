#Input Variables

variable "instance_type" {
    type = string
    description = "This is an instance type for EC2 instance"
    default = "t2.micro"
}
variable "env" {
    type = string
    description = "Indicates the enviroment"
    default = "prod"
}
variable "tags" {
    type = map
    default = {
        Name = "development"
    }
}