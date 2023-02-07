resource "aws_instance" "Session-3EC2" {
    ami = var.instance_type
    instance_type = var.instance_type            # insted of specifing the t2.micro we refer to variables where it will look for the instance type
    vpc_security_group_ids = [ aws_security_group.main.id ] # since id for sg is NOT known we do not indicate id
    tags = {                   # map
        Name = var.env
    }
}

# Data Types:
# 1. Integer
# 2. Float
# 3. number
# 4. string
# 5. boolean

#List
# List of strings = ["fruits", "veggies", "dairy"]
# List of numbers = [ "5", "8", "101" ]

# Reference to Resource is used to add securioty group to the instance
# Attiribute known after creation
# Reference before creating 
# when adding double quotes "aws_security_group.main.id" = static or hard coded value string, here it will go and and take default security group from aws acc
# when removing double quotes aws_security_group.main.id = reference - this is dymanic , so here you can use for terraform to go and look for id
# Reference to input variable 
# var.variable_name 