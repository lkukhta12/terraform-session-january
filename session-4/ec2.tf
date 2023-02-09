resource "aws_instance" "Session-3EC2" {
    ami = data.aws_ami.amazon_linux_2.id
    instance_type = var.instance_type            # insted of specifing the t2.micro we refer to variables where it will look for the instance type
    vpc_security_group_ids = [ aws_security_group.main.sg.id ] # since id for sg is NOT known we do not indicate id
    tags = {                   # map
        Name = var.env
    }
}

# References:

#Resources
#Input variables
#Local values
#Child module outputs
#Data sources
#Filesystem and workspace info
#Block-local values