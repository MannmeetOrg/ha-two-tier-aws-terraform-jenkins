resource "aws_db_subnet_group" "main" {
  name       = "db-subnet-group"
  subnet_ids = aws_subnet.db[*].id

  tags = {
    Name = "DB subnet group"
  }
}

resource "aws_db_instance" "mysql" {
  identifier             = "ha-db"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  multi_az               = true
  publicly_accessible    = false
  storage_encrypted      = true
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  tags = {
    Name = "HA-RDS"
  }
}
