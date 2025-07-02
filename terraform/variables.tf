variable "region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.10.0.0/16"
}

variable "public_subnets" {
  type    = list(string)
  default = ["10.10.1.0/24", "10.10.2.0/24"]
}

variable "app_subnets" {
  type    = list(string)
  default = ["10.10.3.0/24", "10.10.4.0/24"]
}

variable "db_subnets" {
  type    = list(string)
  default = ["10.10.5.0/24", "10.10.6.0/24"]
}

variable "instance_type" {
  default = "t2.micro"
}

variable "db_password" {
  description = "DB password retrieved from Jenkins"
  type        = string
}

variable "db_username" {
  default = "admin"
}

variable "db_name" {
  default = "appdb"
}
