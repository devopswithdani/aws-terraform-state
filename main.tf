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

data "aws_ami" "amzn-linux-2023-ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

locals {
  instances = {
    "testnode-1" = {
      region      = "ap-south-1"
      instance_type = "t3.micro"
    },
    "testnode-2" = {
      region      = "ap-south-1"
      instance_type = "t3.micro"
    },
    "testnode-3" = {
      region      = "ap-south-1"
      instance_type = "t3.micro"
    }

  }
}



resource "aws_instance" "for_each-instances" {
  for_each = local.instances
  tags = {
    Name = each.key
      }
  ami           = data.aws_ami.amzn-linux-2023-ami.id
  instance_type = each.value.instance_type
  
}