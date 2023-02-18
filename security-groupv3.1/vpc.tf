# Creating VPC , Instance, Auto Scalling, Password, and creating locals

resource "aws_vpc" "autoscale_vpc" {
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"
  tags = local.common_tags
}
resource "aws_instance" "autoscalr" {
    ami = var.ami
    instance_type = var.instance_type
}
# Launch template
resource "aws_launch_template" "autoscale" {
    name = "autoscale"
    launch_template_description = "Launch template"
    update_default_version      = true
    ami = "ami-0aa7d40eeae50c9a9"
    instance_type = "t2.micro"
}
resource "aws_autoscaling_group" "autoscale" {
    name = "autoscale"
    min_size = 1
    max_size = 3
    desired_capacity = 1
    health_check_grace_period = 300
    health_check_type = "ELB"
    launch_template = aws_launch_template.autoscale
    tag {
        key = "auto"
        value = "scale"
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
