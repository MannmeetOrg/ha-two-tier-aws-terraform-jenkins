module "rds" {
  source         = "./rds"
  db_password    = var.db_password
  # ...other variables
}
