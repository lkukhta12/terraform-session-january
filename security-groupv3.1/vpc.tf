# Creating VPC , Instance, Auto Scalling, Password, and creating locals

resource "aws_vpc" "autoscale_vpc" {
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"
  tags = local.common_tags
}
#resource "aws_instance" "autoscale" {
   # ami = var.ami
   # instance_type = var.instance_type
#}
# Launch template
resource "aws_launch_template" "autoscale" {
    image_id = var.ami
    instance_type = var.instance_type
}
resource "aws_autoscaling_group" "autoscale_ag" {
    min_size = 1
    max_size = 3
    desired_capacity = 1
    #health_check_grace_period = 300 # in seconds
    #health_check_type = "ELB" #enabled
    launch_template = {
        id = aws_launch_template.autoscale.id
    }
}
resource "random_password" "db_password" {
    length = 25
    special = true
    override_special = "%@"
}
output "passwords" {
    value = random_password.db_password
    sensitive = true
  
}
locals {
    #Locals Block
    name = "aws-${var.team}-${var.env}-${var.app}-resource-${var.index}"
    common_tags = {
        Enviroment = var.env
        Team = var.team
        App = var.app
        Managed_by = var.Managed_by
        Owner = var.Owner
    }
}
