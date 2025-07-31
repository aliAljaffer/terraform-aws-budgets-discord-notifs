terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.6.0"
    }
  }
}

provider "aws" {
  region     = var.AWS_REGION
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY
  default_tags {
    tags = {
      ProvisionedBy = "Terraform"
      Project       = "budget-discord-notifications"
    }
  }
}

