resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.datacentre-VPC.id
 
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.datacentre-VPC_IGW.id
  }
 
  tags = {
    Name   = "public_rt_datacentre-VPC"
  }
}

resource "aws_route_table" "private_rt" {
  count = length(var.private_cidrs)
  vpc_id = aws_vpc.datacentre-VPC.id
 
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.NAT[count.index].id
  }
  tags = {
    Name   = "private_rt1a_datacentre"
  }
}

resource "aws_route_table_association" "publicroute" {
  count = length(var.public_cidrs)
  subnet_id = aws_subnet.datacentre-VPC_pubsubnet[count.index].id
  route_table_id = aws_route_table.public_rt.id
  depends_on     = [aws_route_table.public_rt]
}

resource "aws_route_table_association" "privateroute" {
  count = length(var.private_cidrs)
  subnet_id      = aws_subnet.datacentre-VPC_privsubnet[count.index].id
  route_table_id = aws_route_table.private_rt[count.index].id
  depends_on     = [aws_route_table.private_rt]
}


