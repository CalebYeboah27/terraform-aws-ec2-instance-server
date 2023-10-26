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
#   ami           = "ami-08d70e59c07c61a3a"
#   instance_type = "t2.micro"

#   tags = {
#     Name = "AppServerInstance"
#   }
# }

module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "app-s3-bucket111115934"
  acl    = "private"

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }
}
