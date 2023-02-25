# Topic: calling a child module remotely 
module "ec2" {
    source = "github.com/lkukhta12/terraform-session-january//modules/modules/ec2?ref=v1.0.1"
    env = "dev"
    ami = "ami-0aa7d40eeae50c9a9"
    instance_type = "t2.micro"
}


#Tree of dependencies 
#github.com = Domain name 
#Akumo = organization
#terraform -session-janaury = Repository
#tree = 
#main = Branch
#module is subdirectory
#ec2 =subdirectory