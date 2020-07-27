
provider "aws" {
  access_key = "" //"your access_key"
  secret_key = ""  //"your secret_key"
  region = var.aws_region
  //alias  = var.aws_region 
  version = "~> 2.0"
}

data "aws_availability_zones" "available" {}

resource "aws_dynamodb_table" "dynamoDB" {
  name             = var.dynamoDbname
  hash_key         = var.hash_key
  billing_mode     = var.billing_mode
  read_capacity    = var.read_capacity
  write_capacity   = var.write_capacity

  attribute {
    name = var.hash_key
    type = var.type
  }

  replica {
    region_name = var.aws_region
  }
}

