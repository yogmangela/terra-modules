variable "access_key" {
  type= string
}
variable "secret_key" {
  type=string
}
variable "region" {
  type=string
  default="eu-west-1"
}

variable "ami" {
  type=string
  default="ami-0701e7be9b2a77600"
}

variable "instance_type" {
  type = string
  default="t2.micro"
}
variable "key_name" {
  type=string
}

variable "security_groups" {
  type=string
  default="OpenToAllTraffic"
}


