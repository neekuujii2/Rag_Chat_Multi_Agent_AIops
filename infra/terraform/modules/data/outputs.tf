output "rds_endpoint" { value = aws_db_instance.postgres.address }
output "redis_endpoint" { value = aws_elasticache_replication_group.redis.primary_endpoint_address }
output "documents_bucket" { value = aws_s3_bucket.documents.bucket }
