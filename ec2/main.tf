provider "aws" {
    access_key = var.access_key
    secret_key = var.secret_key
    region = var.region
}

resource "aws_instance" "UbuntuServer" {
  ami= var.ami
  // ami-0701e7be9b2a77600 (64-bit x86) 
  // ami-08c8c70a9d43f0fdb (64-bit Arm)
  instance_type= var.instance_type
  key_name = var.key_name
  security_groups = var.security_groups
  user_data = file("install_docker.sh")
  tags={
      Name= "Terraform Server test"
  }
}
