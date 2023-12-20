terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~>5.1.0"
    }
  }
  backend "s3" {
    bucket          = "wefoodiesterra"
    key             = "wefoodiesterra/terraform.tfstate"
    dynamodb_table  = "wefoodies-client-infra"
    region          = "us-east-1"
  }
}
