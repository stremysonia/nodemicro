#terraform version and backend
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    bucket = "jespdatacentre"
    key    = "jespdatacentre/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "datacentreterraform-state-lock"
    encrypnt        = true
  }
}