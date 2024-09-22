# /terraform/modules/rds/variables.tf
variable environment {
  description = "The environment (dev, prod, etc.)"
  type        = string
}

variable vpc_id {
  description = "The ID of the VPC"
  type        = string
}

variable subnet_ids {
  description = "List of subnet IDs"
  type = list(string)
}

variable db_name {
  description = "The name of the database"
  type        = string
}

variable db_username {
  description = "Username for the database"
  type        = string
}

variable "db_password" {
  description = "Password for the database"
  type        = string
  sensitive   = true
}
