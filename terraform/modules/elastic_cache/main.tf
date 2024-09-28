# /terraform/modules/elastic_cache/main.tf
resource "aws_elasticache_subnet_group" "main" {
  name       = "threedays-${var.environment}-elasticache-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "threedays-${var.environment}-elasticache-subnet-group"
  }
}

resource "aws_security_group" "redis" {
  name        = "threedays-${var.environment}-redis-sg"
  description = "Security group for ElastiCache Redis"
  vpc_id      = var.vpc_id

  ingress {
    from_port = 6379
    to_port   = 6379
    protocol  = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "threedays-${var.environment}-redis-sg"
  }
}

resource "aws_elasticache_cluster" main {
  cluster_id           = "threedays-${var.environment}-redis"
  engine               = "redis"
  node_type            = "cache.t3.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis7"
  engine_version       = "7.0"
  port                 = 6379

  subnet_group_name = aws_elasticache_subnet_group.main.name
  security_group_ids = [aws_security_group.redis.id]

  tags = {
    Name = "threedays-${var.environment}-redis"
  }
}
