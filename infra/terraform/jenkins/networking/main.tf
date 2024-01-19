data "aws_availability_zones" "available" {
  state = "available"
}


resource "aws_vpc" "datacentre-VPC" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    "Name" = "datacentre-VPC"
  }
}

#setting up the internet gateway
resource "aws_internet_gateway" "datacentre-VPC_IGW" {
  vpc_id = aws_vpc.datacentre-VPC.id

  tags = {
    "Name" = "datacentre-VPC_IGW"
  }
}

# Elastic IP for Nat Gateway
resource "aws_eip" "datacentre-VPC_nat_elastic_ip" {
  count = 2
  vpc = true
  tags = {
    "Name" = "datacentre-VPC_Elastic_IP${count.index}"
  }
}

