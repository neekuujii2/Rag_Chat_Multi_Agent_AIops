variable "aws_region" { type = string }
variable "bucket_suffix" { type = string }
variable "db_username" { type = string }
variable "db_password" { type = string, sensitive = true }
variable "redis_auth_token" { type = string, sensitive = true }
