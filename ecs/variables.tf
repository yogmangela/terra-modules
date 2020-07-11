variable "aws_region" {
  default     = "eu-west-1"
}

variable "aws_account_id" {
  description = "AWS account ID"
  default="415446080277"
}

variable "az_count" {
  default     = "2"
}

variable "app_image" {
  default     = "yogmicroservices/bulletinboard:1.0"
}

variable "app_port" {
  default     = 8080
}

variable "app_count" {
  description = "Number of docker containers to run"
  default     = 2
}

variable "fargate_cpu" {
  default     = 256
}

variable "fargate_memory" {
  default     = 512
}