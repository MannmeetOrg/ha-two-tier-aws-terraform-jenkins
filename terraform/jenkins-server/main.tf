module "jenkins" {
  source = "./.."
  db_password = "${var.db_password}"
}
