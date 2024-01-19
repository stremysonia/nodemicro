#creating security group
resource "aws_security_group" "bastion_host_sg" {
  name = "bastion_host_sg"
  description = "this is the security group for ssh access"
  vpc_id = aws_vpc.datacentre-VPC.id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [var.my_ip]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
  }
  
  tags = {
    "Name"="bastion_host_sg"
  }
}


#creating Jenkins security group
resource "aws_security_group" "jenkins_master_sg" {
  name        = "jenkins_master_sg"
  description = "Allow traffic on port 8080 and enable SSH"
  vpc_id      = aws_vpc.datacentre-VPC.id
 
  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion_host_sg.id]
  }
 
  ingress {
    from_port          = 8080
    to_port            = 8080
    protocol           = "tcp"
    security_groups     = [aws_security_group.elb_jenkins_sg.id]
  }
 
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }
 
  tags = {
    Name   = "jenkins_master_sg"
  }
}

resource "aws_security_group" "elb_jenkins_sg" {
    name        = "elb_jenkins_sg"
    description = "Allow http traffic"
    vpc_id      = aws_vpc.datacentre-VPC.id
  
    ingress {
      from_port   = "80"
      to_port     = "80"
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
      from_port   = "8080"
      to_port     = "8080"
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
      from_port   = "443"             
      to_port     = "443"             
      protocol    = "tcp"             
      cidr_blocks = ["0.0.0.0/0"]     
   }

    egress {
      from_port   = "0"
      to_port     = "0"
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      Name   = "elb_jenkins_sg"
    }
}
