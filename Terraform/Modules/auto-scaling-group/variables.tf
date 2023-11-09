variable "key_name" {
  type = string
  default = "vockey"
}

variable "instance_type" {
  type = string
  default = "t3.small"
}

variable "ami" {
  type = string
  default = "ami-03eb6185d756497f8"
}

variable "volume_type" {
  type    = string
  default = "gp3"
}

variable "volume_size" {
  type    = number
  default = 8
}

variable "sec_group" {
  type = string
}

variable "my_subnet_private01" {
  type = string
}

variable "my_subnet_private02" {
  type = string
}