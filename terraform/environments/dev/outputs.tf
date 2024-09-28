# /terraform/environments/dev/outputs.tf
output "elastic_beanstalk_url" {
  description = "URL of the Elastic Beanstalk environment"
  value       = module.elastic_beanstalk.environment_url
}

output "ecr_repository_url" {
  description = "URL of the ECR repository"
  value       = module.ecr.repository_url
}

output "rds_endpoint" {
  description = "Endpoint of the RDS instance"
  value       = module.rds.db_endpoint
}

output "redis_endpoint" {
  description = "Endpoint of the ElastiCache Redis cluster"
  value       = module.redis.redis_endpoint
}
