data "aws_availability_zones" "availzones" {}

resource "aws_vpc" "jenks-vpc" {
  cidr_block = var.jenkins_cidr_block
  enable_dns_hostnames = true

  tags = {
    Name = var.jenkins_vpc
  }
}


resource "aws_internet_gateway" "jenkinsigw" {
  vpc_id = aws_vpc.jenks-vpc.id

  tags = {
    Name = "${var.jenkins_vpc}-igw"
  }
}



resource "aws_eip" "jenksnateip" {
    vpc = true

    tags = {
        Name = "${var.jenkins_vpc}-eip"
    }
  
}



resource "aws_nat_gateway" "jenkinsnat" {
    allocation_id = aws_eip.jenksnateip.id
    tags = {
      Name = "${var.jenkins_vpc}-nat"
    }
  
}
