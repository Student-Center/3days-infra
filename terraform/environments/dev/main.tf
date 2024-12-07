# /terraform/environments/dev/main.tf
provider "aws" {
  region = "ap-northeast-2"
}

terraform {
  cloud {
    organization = "3days"
    workspaces {
      name = "3days-dev"
    }
  }
}

module "vpc" {
  source      = "../../modules/vpc"
  environment = "dev"
}

module "ecr" {
  source          = "../../modules/ecr"
  repository_name = "threedays-app"
}

module "rds" {
  source      = "../../modules/rds"
  environment = "dev"
  vpc_id      = module.vpc.vpc_id
  subnet_ids  = module.vpc.private_subnet_ids
  db_name     = "threedaysdev"
  db_username = var.db_username
  db_password = var.db_password
}

module "redis" {
  source      = "../../modules/elastic_cache"
  environment = "dev"
  vpc_id      = module.vpc.vpc_id
  subnet_ids  = module.vpc.private_subnet_ids
}

module "elastic_beanstalk" {
  source                = "../../modules/elastic_beanstalk"
  environment           = "dev"
  vpc_id                = module.vpc.vpc_id
  public_subnet_ids     = module.vpc.public_subnet_ids
  app_name              = "threedays-dev"
  solution_stack_name   = "64bit Amazon Linux 2023 v4.3.7 running Docker"
  instance_type         = "t2.micro"
  min_size              = 1
  max_size              = 2
  ecr_repository_url    = module.ecr.repository_url
  rds_security_group_id = module.rds.db_security_group_id
}

module "image_bucket" {
  source      = "../../modules/s3"
  environment = "dev"
  bucket_name = "threedays-dev-image-bucket"
}

module "iam" {
  source                      = "../../modules/iam"
  beanstalk_instance_role_id = module.elastic_beanstalk.instance_role_id
  s3_bucket_arn              = module.image_bucket.bucket_arn
}
