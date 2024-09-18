# /terraform/environments/prod/variables.tf
variable db_name {
  description = "The name of the RDS instance"
  type        = string
}

variable db_username {
  description = "Username for the RDS instance"
  type        = string
}

variable db_password {
  description = "Password for the RDS instance"
  type        = string
  sensitive   = true
}
