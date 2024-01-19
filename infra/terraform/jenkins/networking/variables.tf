variable "namespace" {
    type = string
}

variable "region" {
  description = "AWS region"
  default     = "us-east-1"
  type        = string
}

variable "vpc_cidr" {
  type = string
  description = "the cidr for the vpc"
  default = "172.20.0.0/16"
}

variable "public_cidrs" {
  type = list(string)
  description = "the public cidrs for the vpc"
}

variable "private_cidrs" {
  type = list(string)
  description = "the private cidrs for the vpc"
}

variable "my_ip" {
  type = string
}

