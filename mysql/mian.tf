
provider "aws" {
  region= var.region
  access_key = var.my-access-key
  secret_key = var.my-secret-key
  skip_credentials_validation = true
  version = "~> 2.0"
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