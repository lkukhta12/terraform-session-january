variable "aws_region" {
  type    = string
  default = "us-east-1"
}
variable "vpc_name" {
    type = string
    default = "autoscale_vpc"  
}
variable "vpc_cidr" {
    type = string
    default = "10.0.0.0/16"
}
variable "aws_autoscaling_group" {
    type = string
    default = "autoscale_ag"
}
variable "aws_security_group" {
    type = string
    default = "custom"
}
variable "env" {
    type = string
    description = "Indicates the enviroment"
    default = "dev"
}
variable "team" {
    type = string
    default = "yoyo"
}
variable "app" {
    type = string
    default = "lio"
}
variable "index" {
    type = string
    default = "0"
}
variable "Managed_by" {
    type = string
    default = "terraform"
}
variable "Owner" {
    type = string
    default = "Lidiya"
}
variable "ami" {
    type = string
    default = "ami-0aa7d40eeae50c9a9"
}
variable "instance_type" {
    type = string
    default = "t2.micro"
}
variable "aws_instance" {
    type = string
    default = "autoscale" 
}