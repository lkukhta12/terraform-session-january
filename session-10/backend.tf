terraform {
  backend "s3" {
    bucket = "terraform-session-september-backend-lididi"
    region = "us-east-1"
    key    = "session-10/terraform.ftstate"  # this is indication where does terraform is going to store my files
    dynamodb_table = "terraform-session-sep-statelock"  # Lock table name
  }
}
# You can not use any variables
# If you change words in session-10 than it will create a new obeject in s3 - try not to tounch this

# if you want to isolate infrastructure and reuse your config files, you must isolate your backend first
# Isolating backend (terraform.ftstate) = Isolating Enviroment
# terraform.tfstate file keeps the trackk of your infrastructure