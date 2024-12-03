provider "aws" {
  region = "us-east-1"
}

## Terraform block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

locals {
  vpc_cidr = "10.0.0.0/16"

  public_subnet_cidrs = {
    "us-east-1a" = "10.0.1.0/24"
    "us-east-1b" = "10.0.2.0/24"
    "us-east-1c" = "10.0.3.0/24"
  }

  private_subnet_cidrs = {
    "us-east-1a" = "10.0.4.0/24"
    "us-east-1b" = "10.0.5.0/24"
    "us-east-1c" = "10.0.6.0/24"
  }

  common_tags = {
    "id"             = "2024"
    "owner"          = "arabo"
    "environment"    = "dev"
    "project"        = "purple"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
    "company"        = "EKT"
  }

}

module "VPC" {
  source = "../../../modules/vpc"

  # Passing local variables to the module
  vpc_cidr             = local.vpc_cidr
  public_subnet_cidrs  = local.public_subnet_cidrs
  private_subnet_cidrs = local.private_subnet_cidrs
  common_tags          = local.common_tags
}
