# providers-team-env-app-resource-index#
# aws-devops-dev-tom-sqs-0
variable "tags" {
    type = map()
    default = {
        Enviroment = "dev"
        Team =  "DevOps"
        App = "Jerry"
        Managed_by = "Terraform"
        Owner = "Lidiya"
        Department = "BBC"  
    }
}
# variable can not have variable inside
# local values can have variables inside
# The most efficient way
resource "aws_sqs_queue" "main" {
    name = replace(local.name, "resource", "main-sqs") # referencing to "${var.provider}-${var.env}-${var.app}-main-sqs-${var.index}"
    tags = local.common_tags
}
resource "aws_sqs_queue" "frontend" {
    name = replace(local.name, "resource", "frontend-sqs") # referencing to "${var.provider}-${var.env}-${var.app}-frontend-sqs-${var.index}"
    tags = local.common_tags
}
resource "aws_sqs_queue" "backend" {
    name = replace(local.name, "resource", "backend-sqs") # referencing to "${var.provider}-${var.env}-${var.app}-backend-sqs-${var.index}"
    tags = local.common_tags
}

# Another way - hard and crowded
#resource "aws_sqs_queue" "main" {
    #name = "${var.provider}-${var.env}-${var.app}-main-sqs-${var.index}"
    #tags = merge(
        #var.tags,
        #{Name = "${var.provider}-${var.env}-${var.app}-main-sqs-${var.index}"}
 #   )
#}
#resource "aws_sqs_queue" "main" {
    #name = "${var.provider}-${var.env}-${var.app}-frontend-sqs-${var.index}"
    #tags = merge(
        #var.tags,
        #{Name = "${var.provider}-${var.env}-${var.app}-frontend-sqs-${var.index}"}
    #)
#}
#resource "aws_sqs_queue" "main" {
    #name = "${var.provider}-${var.env}-${var.app}-backend-sqs-${var.index}"
    #tags = merge(
        #var.tags,
        #{Name = "${var.provider}-${var.env}-${var.app}-backend-sqs-${var.index}"}
    #)
#}

# merge is designed to merge multiple maps into a single map

# The below is in the hard - not efficient way
#resource "aws_sqs_queue" "main" {
    #name = "${var.provider}-${var.env}-${var.app}-main-sqs-${var.index}"
    #tags = {
        #Enviroment = var.env
        #Name = "${var.provider}-${var.env}-${var.app}-main-sqs-${var.index}"
        #Team =  var.team
        #App = var.app
        #Managed_by = "Terraform"
        #Owner = "Lidiya"
        #Department = "BBC"
    #} 
#}
#resource "aws_sqs_queue" "frontend" {
    #name = "${var.provider}-${var.env}-${var.app}-frontend-sqs-${var.index}"
    #tags = {
       # Enviroment = var.env
        #Name = "${var.provider}-${var.env}-${var.app}-frontend-sqs-${var.index}"
        #Team =  var.team
        #App = var.app
        #Managed_by = "Terraform"
        #Owner = "Lidiya"
        #Department = "BBC"
    #}
#}
#resource "aws_sqs_queue" "backend" {
    #name = "${var.provider}-${var.env}-${var.app}-backend-sqs-${var.index}"
    #tags = {
        #Enviroment = var.env
        #Name = "${var.provider}-${var.env}-${var.app}-backend-sqs-${var.index}"
        #Team =  var.team
        #App = var.app
        #Managed_by = "Terraform"
        #Owner = "Lidiya"
        #Department = "BBC"
    #} 
#}

#variable "provider"
#variable "team"
#variable "env"
#variable "app"{
#variable "index"
  

# Naming and tagging standarts

// Naming Standard
# teams = cloud, devops, qa, security
#apps = elk, bean, lack, jerry, tom, pop
# cloud providers = aws, azure, google
# enviroment = dev, qa, stag, prod
# providers-team-env-app-loadbalancer
# aws-cloud-dev-jerry-loadbalancer#

 // Tagging Standard -  Common Tags:
 # Name = aws-cloud-dev-jerry-loadbalancer-0 # Name of the resource
 # Enviroment = Dev 
 # Team = cloud
 # App = Jerry 
 # Managed_by = "Terraform, CloudFomation, Python, Manual"
 # Owner = Lidiya
