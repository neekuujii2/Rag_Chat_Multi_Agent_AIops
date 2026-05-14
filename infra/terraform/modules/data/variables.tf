variable "name" { type = string }
variable "suffix" { type = string }
variable "vpc_id" { type = string }
variable "private_subnet_ids" { type = list(string) }
variable "db_instance_class" { type = string }
variable "db_username" { type = string }
variable "db_password" { type = string, sensitive = true }
variable "redis_node_type" { type = string }
variable "redis_auth_token" { type = string, sensitive = true }
variable "tags" { type = map(string) }
