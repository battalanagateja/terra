terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
  access_key = "AKIAQPVMNDX37QG3QI6C"
  secret_key = "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"

}
