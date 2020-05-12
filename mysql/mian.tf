


resource "aws_db_instance" "default" {
  allocated_storage    = var.allocated
  storage_type         = var.type
  engine               = var.eng
  engine_version       = var.eng_ver
  instance_class       = var.instance_class
  name                 = var.db_name
  username             = var.usr
  password             = var.pwd
}