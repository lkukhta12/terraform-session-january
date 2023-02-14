terraform {
  required_version = "~> 1.3.7" #Terraform Version
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.53.0" #AWS Provider Version
    }
  }
}

#Terraform = Terraform v1.3.7
#AWS Provider = v4.53.0

#Semantic versioning 
# As in our example above version 1.3.7
#1 = Major
#3 = Minor
# = Patch

#Lazy Versioning 
#  >= 0.13, < 0.14 = every patch vesrion is included
# = 0.14 it must be a 0.14 restricted
# ~> 0.13 =  0.13.0 to 0.13.x - all patches for the version
# ~> = lazy constraints