output "database_name" {
  value = aws_db_instance.db_mysql.name
}

output "database_arn" {
  value = aws_db_instance.db_mysql.arn
}
