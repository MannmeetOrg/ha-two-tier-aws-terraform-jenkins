## modules/rds/main.tf
resource "aws_db_subnet_group" "rds" {
  name       = "rds-subnet-group"
  subnet_ids = var.subnet_ids
}

resource "aws_db_instance" "app" {
  identifier         = "app-db"
  engine             = "mysql"
  engine_version     = "8.0.34"
  instance_class     = var.instance_type
  allocated_storage  = 20
  username           = var.db_username
  password           = var.db_password
  db_subnet_group_name = aws_db_subnet_group.rds.name
  vpc_security_group_ids = var.security_group_ids
  multi_az           = true
  skip_final_snapshot = true
}