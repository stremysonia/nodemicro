#Create NAT Gateway
resource "aws_nat_gateway" "NAT" {
  count = length(var.public_cidrs)
  allocation_id = aws_eip.datacentre-VPC_nat_elastic_ip[count.index].id
  subnet_id     = aws_subnet.datacentre-VPC_pubsubnet[count.index].id 

  tags = {
    "Name" = "NAT Gateway_datacentre-VPC${count.index + 1}"
  }
}

