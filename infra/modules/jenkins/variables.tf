variable "jenkins_cidr_block" {
  description = "VPC CIDR block"
  default     = "10.0.0.0/16"
}

variable "jenkins_vpc" {
  default = "jenkins-vpc"
}
