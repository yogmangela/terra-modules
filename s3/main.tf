provider "aws" {
  region="eu-west-1"
  access_key = var.my-access-key
  secret_key = var.my-secret-key
  skip_credentials_validation = true
  version = "~> 2.0"
}

resource "aws_s3_bucket" "web_bucket" {
  bucket = var.bucket_name
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}