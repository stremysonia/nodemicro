terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.32.1"
    }
  }
  backend "s3" {
    
  }
}

provider "aws" {
  region = var.web_region
}


module "web_client" {
  source = "../../web_client"
}