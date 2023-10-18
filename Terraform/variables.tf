variable "region" {
  type    = string
  default = "us-east-1"
}

variable "ami" {
  type    = string
  default = "ami-03eb6185d756497f8"
}

variable "instance_type" {
  type    = string
  default = "t3.small"
}

variable "volume_type" {
  type    = string
  default = "gp3"
}

variable "volume_size" {
  type    = number
  default = 8
}

variable "key_name" {
  type    = string
  default = "vockey"
}