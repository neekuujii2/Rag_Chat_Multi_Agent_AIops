resource "aws_db_subnet_group" "this" {
  name       = "${var.name}-db-subnets"
  subnet_ids = var.private_subnet_ids
  tags       = var.tags
}

resource "aws_security_group" "rds" {
  name        = "${var.name}-rds"
  description = "RDS access"
  vpc_id      = var.vpc_id
  tags        = var.tags
}

resource "aws_db_instance" "postgres" {
  identifier                   = "${var.name}-postgres"
  engine                       = "postgres"
  engine_version               = "16.4"
  instance_class               = var.db_instance_class
  allocated_storage            = 100
  max_allocated_storage        = 500
  db_name                      = "rag"
  username                     = var.db_username
  password                     = var.db_password
  db_subnet_group_name         = aws_db_subnet_group.this.name
  vpc_security_group_ids       = [aws_security_group.rds.id]
  backup_retention_period      = 14
  backup_window                = "18:00-19:00"
  maintenance_window           = "sun:20:00-sun:21:00"
  skip_final_snapshot          = false
  final_snapshot_identifier    = "${var.name}-postgres-final"
  multi_az                     = true
  storage_encrypted            = true
  performance_insights_enabled = true
  enabled_cloudwatch_logs_exports = ["postgresql", "upgrade"]
  tags = var.tags
}

resource "aws_elasticache_subnet_group" "this" {
  name       = "${var.name}-redis-subnets"
  subnet_ids = var.private_subnet_ids
}

resource "aws_security_group" "redis" {
  name   = "${var.name}-redis"
  vpc_id = var.vpc_id
  tags   = var.tags
}

resource "aws_elasticache_replication_group" "redis" {
  replication_group_id       = "${var.name}-redis"
  description                = "Redis for ${var.name}"
  node_type                  = var.redis_node_type
  num_cache_clusters         = 2
  port                       = 6379
  automatic_failover_enabled = true
  multi_az_enabled           = true
  subnet_group_name          = aws_elasticache_subnet_group.this.name
  security_group_ids         = [aws_security_group.redis.id]
  at_rest_encryption_enabled = true
  transit_encryption_enabled = true
  auth_token                 = var.redis_auth_token
  parameter_group_name       = "default.redis7"
  tags                       = var.tags
}

resource "aws_s3_bucket" "documents" {
  bucket = "${var.name}-documents-${var.suffix}"
  tags   = var.tags
}

resource "aws_s3_bucket_versioning" "documents" {
  bucket = aws_s3_bucket.documents.id
  versioning_configuration { status = "Enabled" }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "documents" {
  bucket = aws_s3_bucket.documents.id
  rule {
    apply_server_side_encryption_by_default { sse_algorithm = "AES256" }
  }
}
