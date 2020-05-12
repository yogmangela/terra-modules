provider "aws" {
    region = var.region
    my-access-key = var.my-access-key
    my-secret-key = var.my-secret-key
}

resource "aws_db_instance" "db_mysql" {
  allocated_storage    = var.allocated
  storage_type         = var.type
  engine               = var.eng
  engine_version       = var.eng_ver
  instance_class       = var.instance_class
  name                 = var.db_name
  username             = var.usr
  password             = var.pwd
}