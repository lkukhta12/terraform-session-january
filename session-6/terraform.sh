#!/bin/bash 

rm -rf .terraform*
read -p "Which environment would you like?" ENV 
echo $ENV 
sed -i "s/_env_/$ENV/g" backend.tf

echo "Environment is set to $ENV"

terraform init
terraform plan -var-file=$ENV.tfvars

terraform destroy -var-file=$ENV.tfvars -auto-approve

echo "Rolling back the backend"
sed -i "s/$ENV/_env_/g" backend.tf
echo "Script ran successfully"

##### terraform apply -var-file=$ENV.tfvars # user -auto-approve only if you sure your script has no mistakes

#1. Updating backend file
#2. Terraform init
#3. Terraform plan -var-file=