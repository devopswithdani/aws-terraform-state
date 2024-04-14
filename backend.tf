terraform {
  backend "s3" {
    bucket = "dani-terraform-state"
    key    = "devops-team/terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "dani_terraform_state_locking"
  }
}
