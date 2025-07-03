## modules/vpc/variables.tf
variable "cidr" {}
variable "public_subnets" { type = list(string) }
variable "web_subnets" { type = list(string) }
variable "app_subnets" { type = list(string) }
variable "db_subnets" { type = list(string) }
variable "azs" { type = list(string) }