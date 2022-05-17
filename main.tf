terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.9"
    }
  }
  required_version = ">= 1.1.8"
}

provider "aws" {
  region = "eu-west-3"
  default_tags {
    tags = {
      Name       = var.project_name
      deployment = var.deployment
      owner      = var.owner
    }
  }
}
