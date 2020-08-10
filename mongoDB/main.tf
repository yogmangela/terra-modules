
provider "aws" {
  region     = var.aws_region
  version    = "~> 2.0"
}


module "mongoDb" {
    source = "git::https://github.com/yogmangela/terra-modules//ec2"
    access_key =     //"your access_key"
    secret_key =    // "your secret_key"
    key_name= // your pem key name wich is already in your accout /reagion
    security_groups= // security Group which is provided as a list i.e ["HTTPS-ONLY"]
    ami="ami-07d9160fa81ccffb5"
}

