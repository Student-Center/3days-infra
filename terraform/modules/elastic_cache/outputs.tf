# /terraform/modules/elastic_cache/outputs.tf
output "redis_endpoint" {
  description = "The connection endpoint for the Redis cluster"
  value       = aws_elasticache_cluster.main.cache_nodes[0].address
}

output "redis_port" {
  description = "The port number of the Redis cluster"
  value       = aws_elasticache_cluster.main.port
}

output "redis_security_group_id" {
  description = "The ID of the Redis security group"
  value       = aws_security_group.redis.id
}
