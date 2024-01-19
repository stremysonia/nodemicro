#creating the subnet
resource "aws_subnet" "datacentre-VPC_pubsubnet" {
  count = length(var.public_cidrs)
  vpc_id = aws_vpc.datacentre-VPC.id
  cidr_block = var.public_cidrs[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true 
  depends_on              = [aws_vpc.datacentre-VPC]
  tags = {
    "Name" = "datacentre-VPC_pubsubnet${count.index + 1}"
  }
}

resource "aws_subnet" "datacentre-VPC_privsubnet" {
  count = length(var.private_cidrs)
  vpc_id = aws_vpc.datacentre-VPC.id
  cidr_block = var.private_cidrs[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = false 
  depends_on              = [aws_vpc.datacentre-VPC]
  tags = {
    "Name" = "datacentre-VPC_privsubnet${count.index + 1}"
  }
}

