resource "aws_s3_bucket" "tfbucket" {
    bucket = "dani-labs-tftestbucket"
}

resource "aws_vpc" "test_main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main_terraform_vpc"
  }
}