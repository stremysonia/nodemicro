data "aws_ami" "jenkins-master" {
  most_recent = true
  owners      = ["self"]
 
  filter {
    name   = "name"
    values = ["jenkins-master-*"]
  }
}

data "aws_ami" "ubuntu-linux-2004" {
  most_recent = true
  owners      = ["099720109477"] # Canonical
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

//bastion host
resource "aws_instance" "bastion" {
  ami           = data.aws_ami.amazon-linux-2.id
  instance_type = var.instance_type
  vpc_security_group_ids = [var.sg.bastion_sg.id]
  subnet_id = element(var.pub_subnet.datacentre-VPC_pubsubnets, 0).id
  associate_public_ip_address = true
  key_name      = "newkey"
 
  tags = {
    Name = "bastion"
    Author = "Jespson"
  }
}

resource "aws_instance" "Jenkins-server" {
  ami                         = data.aws_ami.jenkins-master.id
  instance_type               = var.instance_type
  subnet_id                   = element(var.priv_subnet.datacentre-VPC_privsubnets, 0).id
  vpc_security_group_ids      = [var.sg.jenkins_sg.id]
  key_name                    = "newkey"
  
  # root disk
  root_block_device {
    volume_type           = "gp3"
    volume_size           = 30
    delete_on_termination = false
  }
 
  tags = {
    Name   = "jenkins_master1a"
  }
}

resource "aws_instance" "AnsibleController" {
  ami                         = data.aws_ami.amazon-linux-2.id
  instance_type               = var.instance_type
  subnet_id                   = element(var.pub_subnet.datacentre-VPC_pubsubnets, 0).id
  vpc_security_group_ids      = [var.sg.bastion_sg.id]
  associate_public_ip_address = true
  user_data                   = file("./InstallAnsibleCN.sh")
  key_name      = "newkey"
  
  # root disk
  root_block_device {
    volume_size           = var.linux_root_volume_size
    volume_type           = var.linux_root_volume_type
    delete_on_termination = false
    encrypted             = true
  }

  tags = {
    "Name" = "Ansible-Controller"
  }
}
