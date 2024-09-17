# /terraform/modules/vpc/variables.tf
variable "environment" {
  description = "The environment (dev, prod, etc.)"
  type        = string
}
