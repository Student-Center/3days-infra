# /terraform/modules/rds/main.tf
resource aws_db_subnet_group main {
  name       = "3days-${var.environment}-db-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "3days-${var.environment}-db-subnet-group"
  }
}

resource aws_security_group db {
  name        = "3days-${var.environment}-db-sg"
  description = "Security group for RDS"
  vpc_id      = var.vpc_id

  ingress {
    from_port = 3306
    to_port   = 3306
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
    Name = "3days-${var.environment}-db-sg"
  }
}

resource aws_db_instance main {
  engine               = "mysql"
  engine_version       = "8.0.34"
  instance_class       = "db.t3.micro"
  allocated_storage    = 20
  storage_type         = "gp2"
  db_name              = var.db_name
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = "default.mysql8.0"

  vpc_security_group_ids = [aws_security_group.db.id]
  db_subnet_group_name = aws_db_subnet_group.main.name
  publicly_accessible  = false
  skip_final_snapshot  = true

  tags = {
    Name = "3days-${var.environment}-db"
  }
}
