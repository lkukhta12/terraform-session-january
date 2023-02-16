# providers-team-env-app-resource-index#
# aws-devops-dev-tom-sqs-0
locals {
  name = "aws-${var.team}-${var.env}-${var.app}-resource-${var.index}"
  common_tags = {}
  Enviroment = var.env
  Team = var.team
  App = var.app
  Managed_by = var.Managed_by
  Owner = var.Owner
}

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