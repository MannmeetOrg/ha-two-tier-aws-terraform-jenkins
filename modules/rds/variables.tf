## modules/rds/variables.tf
variable "instance_type" {}
variable "db_username" {}
variable "db_password" {}
variable "subnet_ids" { type = list(string) }
variable "security_group_ids" { type = list(string) }