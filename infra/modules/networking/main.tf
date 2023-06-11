data "aws_availability_zones" "damnazs" {}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "4.0.1"  
  # VPC Basic Details
  name            = "${var.namespace}-vpc"
  cidr            = var.vpc_cidr_block
  azs             = data.aws_availability_zones.damnazs.names
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
  # NAT Gateways - Outbound Communication
  enable_nat_gateway = true
  single_nat_gateway = true

  # VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support   = true

  # Additional Tags to Subnets
  public_subnet_tags = {
    Type = "Public Subnets"
    "kubernetes.io/role/elb" = 1    
    "kubernetes.io/cluster/${var.namespace}" = "shared"        
  }
  private_subnet_tags = {
    Type = "private-subnets"
    "kubernetes.io/role/internal-elb" = 1    
    "kubernetes.io/cluster/${var.namespace}" = "shared"    
  }
  # Instances launched into the Public subnet should be assigned a public IP address.
  map_public_ip_on_launch = true
}