#!/bin/bash

rm -rf .terraform*
read -p "Which enviroent would you like" ENV 
echo $ENV
sed -i "s/_evn_$ENV/g" backend.tf

echo "Enviroment is set to $ENV"

terraform init
terraform plan -var-file=$ENV.tfvars

read -p "Are you sure that you would like to apply?" apply
if $apply == [yes]:
then terraform apply -var-file=$ENV.tfvars -auto-approve
else echo "Terraform is not going to apply"
fi

echo "Rolling back the backend"
sed -i "s/$ENV/_env_/g" backend.tf
echo "Script run succesfully"

##### terraform apply -var-file=$ENV.tfvars # user -auto-approve only if you sure your script has no mistakes

#1. Updating backend file
#2. Terraform init
#3. Terraform plan -var-file=