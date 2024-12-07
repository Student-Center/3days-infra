# /terraform/modules/elastic_beanstalk/outputs.tf
output "environment_url" {
  description = "URL of the Elastic Beanstalk environment"
  value       = aws_elastic_beanstalk_environment.env.cname
}

output "environment_name" {
  description = "Name of the Elastic Beanstalk environment"
  value       = aws_elastic_beanstalk_environment.env.name
}

output "instance_role_id" {
  description = "ID of the Elastic Beanstalk instance IAM role"
  value       = aws_iam_role.beanstalk_instance_role.id
}
