# /terraform/modules/elastic_cache/variables.tf
variable "environment" {
  description = "The environment (dev, prod, etc.)"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs"
  type = list(string)
}
