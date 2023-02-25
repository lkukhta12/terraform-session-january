# Topic: calling a child module remotely 
module "ec2" {
    source = "//github.com/lkukhta12/terraform-session-january/tree/main/modules/modules/ec2"
    env = "dev"
    ami = "ami-0aa7d40eeae50c9a9"
    instance_type = "t2.micro"
}