variable "namespace" {
  description = "projet name"
  type = string
}

variable "vpc_cidr_block" {
  description = "VPC CIDR block"
  default     = "10.0.0.0/16"
}

variable "private_subnets" {
    type = list(string)
}
variable "public_subnets" {
    type = list(string)
}