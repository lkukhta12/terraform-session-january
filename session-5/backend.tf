terraform {
  backend "s3" {
    bucket = "terraform-session-september-backend-lididi"
    region = "us-east-1"
    key    = "session-5/terraform.tfstate"  # this is indication where does terraform is going to store my files
  }
}
