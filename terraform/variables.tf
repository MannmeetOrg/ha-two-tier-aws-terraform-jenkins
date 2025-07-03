variable "region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.10.0.0/16"
}

variable "public_subnets" {
  default = ["10.10.0.0/24", "10.10.1.0/24"]
}

variable "web_subnets" {
  default = ["10.10.2.0/24", "10.10.3.0/24"]
}

variable "app_subnets" {
  default = ["10.10.4.0/24", "10.10.5.0/24"]
}

variable "db_subnets" {
  default = ["10.10.6.0/24", "10.10.7.0/24"]
}

variable "db_username" {
  default = "admin"
}

variable "db_password" {
  description = "RDS MySQL password from Jenkins Secrets Manager"
  type        = string
}

variable "db_name" {
  default = "appdb"
}

variable "key_name" {
  description = "EC2 key pair"
  type        = string
}
