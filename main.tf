# ------------------------------------
# Terraform configuration
# ------------------------------------
terraform {
  required_version = "~>v1.3.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.40"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.4"
    }
  }
  backend "s3" {
    bucket  = "ylt2022-tfstate-bucket"
    key     = "ylt2022-dev.tfstate"
    region  = "ap-northeast-1"
    profile = "terraform"
  }
}

# ------------------------------------
# Provider
# ------------------------------------
// for ap server
provider "aws" {
  profile = "terraform"
  region  = "ap-northeast-1"
}

// for cloudfront
provider "aws" {
  alias   = "virginia"
  profile = "terraform"
  region  = "us-east-1"
}
# ------------------------------------
# Variables
# ------------------------------------
variable "project" {
  type = string
}

variable "environment" {
  type = string
}

variable "domain" {
  type = string
}