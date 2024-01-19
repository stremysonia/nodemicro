output "bastion" {
  value = "${aws_instance.bastion.public_ip}"
}

output "jenkins_master" {
  value = {                                               
    jenkins_master     = aws_instance.Jenkins-server
  }                                                    
}