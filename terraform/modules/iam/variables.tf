variable "beanstalk_instance_role_id" {
  description = "The ID of the Elastic Beanstalk instance IAM role"
  type        = string
}

variable "s3_bucket_arn" {
  description = "The ARN of the S3 bucket"
  type        = string
}
