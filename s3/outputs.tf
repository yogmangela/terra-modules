
output "s3_bucket_name" {
  value = aws_s3_bucket.web_bucket.arn
  description = "s3 bucket name"
}
