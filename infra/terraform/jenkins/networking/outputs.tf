output "vpc" {
  value = aws_vpc.datacentre-VPC                                     
}
 
output "pub_subnet" {
  value = {                                               
    datacentre-VPC_pubsubnets          = "${aws_subnet.datacentre-VPC_pubsubnet.*}"        
    //datacentre-VPC_pubsubnets          = ["${module.aws_subnet.datacentre-VPC_pubsubnet.*}"]            
  }                                                    
}

output "priv_subnet" {
  value = {                                               
    datacentre-VPC_privsubnets          = "${aws_subnet.datacentre-VPC_privsubnet.*}"          
    //datacentre-VPC_pubsubnets          = ["${module.aws_subnet.datacentre-VPC_privsubnet.*}"]          
  }                                                    
}
output "sg" {
  value = {                                               
    bastion_sg     = aws_security_group.bastion_host_sg           
    jenkins_sg     = aws_security_group.jenkins_master_sg                              
    elb_sg         = aws_security_group.elb_jenkins_sg      
  }                                                    
}