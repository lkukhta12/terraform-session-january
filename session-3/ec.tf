resource "aws_instance" "Session-3EC2" {
    ami = "ami-0aa7d40eeae50c9a9"
    instance_type = "t2.micro"
    vpc_security_group_ids = [ aws_security_group.main.id ] # since id for sg is NOT known we do not indicate id
}

#List

#List of strings = ["fruits", "veggies", "dairy"]
#List of numbers = [""""""]

#Reference to Resource is used to add securioty group to the instance
#Attiribute known after creation
#Reference before creating 


#"aws_security_group.main.id" = static or hard coded value string, here 
# aws_security_group.main.id = reference - this is dymanic , so here you can use for terraform to go and look for id