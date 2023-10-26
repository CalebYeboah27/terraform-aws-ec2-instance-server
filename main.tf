terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-west-2"
}

# resource "aws_instance" "app_server" {

# for_each = toset(["one", "two", "three"])

#   name = "instance-${each.key}"

#   ami           = "ami-08d70e59c07c61a3a"
#   instance_type = "t2.micro"

#   tags = {
#     Name = "AppServerInstance"
#   }
# }

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  for_each = toset(["AdventureTech", "NatureEscape", "DataSummit"])

  name = "instance-${each.key}"

  instance_type          = "t2.micro"
  monitoring             = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}


# module "s3_bucket" {
#   source = "terraform-aws-modules/s3-bucket/aws"

#   bucket = "app-s3-bucket111115934"
#   acl    = "private"

#   control_object_ownership = true
#   object_ownership         = "ObjectWriter"

#   versioning = {
#     enabled = true
#   }
# }
