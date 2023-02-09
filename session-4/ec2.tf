resource "aws_instance" "Session-3EC2" {
    ami = data.aws_ami.amazon_linux_2.id
    instance_type = var.instance_type            # insted of specifing the t2.micro we refer to variables where it will look for the instance type
    vpc_security_group_ids = [ aws_security_group.main.id ] # since id for sg is NOT known we do not indicate id
    tags = {                   
        Name = "${var.env}-instance" # dev-instance
        Name1 = format("%s-instance", var.env)   # dev-instance
    }
}
resource "aws_instance" "Session-3EC2_frontend" {
    ami = data.aws_ami.amazon_linux_2.id
    instance_type = var.instance_type            # insted of specifing the t2.micro we refer to variables where it will look for the instance type
    vpc_security_group_ids = [ aws_security_group.main.id ] # since id for sg is NOT known we do not indicate id
    tags = {                   
        Name = "${var.env}-frontend-instance"
        Name1 = format("%s-frontend-instance", var.env)   # dev-frontend-instance
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