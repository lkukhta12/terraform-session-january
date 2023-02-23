# Terraform has 2 Modules: Root and Child
# Child Module = declare the resources
# Root Module = call the cild module, run Terraform Commands

# Local Modole = module is in your filesystem
# Remote Module = SCM, HTTP, URL, Terraform Cloud or Enterprise Private Registries


module "ec2_instance" {
    source = "../../modules/modules/ec2" # This where you indicate teh location of the child module
    ###### variables - you need/MUST to define your variables in the following section ##### 
    ##### These 3 variables are most important ones ##########
    env = "dev"
    ami = "ami-0aa7d40eeae50c9a9"
    instance_type = "t2.micro"
}