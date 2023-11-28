terraform {
  required_version = ">=0.13"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

terraform {
  backend "s3" {}
}

variable "profile" {}

provider "aws" {
  region  = "ap-northeast-1"
  profile = var.profile
}