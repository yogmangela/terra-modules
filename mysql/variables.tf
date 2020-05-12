variable "my-access-key" {
  type=string
}

variable "my-secret-key" {
  type=string
}


variable "region" {
  type=string
  default="eu-west-1"
}

variable "allocated" {
    type= number
    default = 20
} 
variable "instance_class" {
  type=string
  default="db.t2.micro"
}
variable "usr" {
  type=string
  default="admin"
}
variable "pwd" {
  type=string
  default="admin2020"
}

variable "type" {
    type= string
    default = "gp2"
} 
variable "eng" {
  type=string
  default="mysql"
}
variable "eng_ver" {
  type=string
  default="5.7"
}

variable "db_name" {
  type=string
  default="mysqldb_test"
}

  
