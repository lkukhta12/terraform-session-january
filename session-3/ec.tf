resource "aws_instance" "Session-3EC2" {
    ami = "ami-0aa7d40eeae50c9a9"
    instance_type = "t2.micro"
    vpc_security_group_ids = [ aws_security_group.main.id ] # since id for sg is NOT known we do not indicate id
    tags = {                   # map
        Name = "development"
    }
}

#List
# List of strings = ["fruits", "veggies", "dairy"]
# List of numbers = [ "5", "8", "101" ]
# Reference to Resource is used to add securioty group to the instance
# Attiribute known after creation
# Reference before creating 
# when adding double quotes "aws_security_group.main.id" = static or hard coded value string, here it will go and and take default security group from aws acc
# when removing double quotes aws_security_group.main.id = reference - this is dymanic , so here you can use for terraform to go and look for id