variable "namespace" {
    type = string
}

variable "aws_key_pair" {
    type = string
}

variable "vpc" {
  type = any
}
 
variable "sg" {
  type = any
}
variable "pub_subnet" {
  type = any
}
variable "priv_subnet" {
  type = any
}
variable "instance_type" {
  type = string
}

variable "linux_associate_public_ip_address" {
  type        = bool
  description = "Associate a public IP address to the EC2 instance"
  default     = true
}

variable "linux_root_volume_size" {
  type        = number
  description = "Volumen size of root volumen of Linux Server"
}

variable "linux_data_volume_size" {
  type        = number
  description = "Volumen size of data volumen of Linux Server"
}

variable "linux_root_volume_type" {
  type        = string
  description = "Volumen type of root volumen of Linux Server. Can be standard, gp3, gp2, io1, sc1 or st1"
  default     = "gp2"
}

variable "linux_data_volume_type" {
  type        = string
  description = "Volumen type of data volumen of Linux Server. Can be standard, gp3, gp2, io1, sc1 or st1"
  default     = "gp2"
}