terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~>5.1.0"
    }
  }
  backend "s3" {
    bucket          = "chefapp-eks-lca8nfyg64p6-state-bucket"
    key             = "chefapp-eks-lca8nfyg64p6-state-bucket/terraform.tfstate"
    dynamodb_table  = "chefapp-eks-lca8nfyg64p6-state-lock"
    region          = "us-east-2"
  }
}