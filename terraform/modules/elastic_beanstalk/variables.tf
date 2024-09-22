# /terraform/modules/elastic_beanstalk/variables.tf
variable "environment" {
  description = "The environment (dev, prod, etc.)"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type = list(string)
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type = list(string)
}

variable "app_name" {
  description = "Name of the Elastic Beanstalk application"
  type        = string
}

variable "solution_stack_name" {
  description = "Solution stack name for Elastic Beanstalk"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for Elastic Beanstalk"
  type        = string
}

variable "min_size" {
  description = "Minimum number of instances"
  type        = number
}

variable "max_size" {
  description = "Maximum number of instances"
  type        = number
}

variable "ecr_repository_url" {
  description = "URL of the ECR repository"
  type        = string
}

variable "rds_security_group_id" {
  description = "ID of the RDS security group"
  type        = string
}
