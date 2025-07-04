variable "aws_region" { default = "us-east-1" }
variable "aws_profile" { default = "default" }
variable "jenkins_ami_id" {}
variable "jenkins_instance_type" { default = "t3.micro" }
variable "jenkins_subnet_id" {}
variable "jenkins_sg_id" {}
variable "bastion_sg_id" {}

variable "db_username" {
  description = "RDS DB admin username"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "RDS DB password"
  type        = string
  sensitive   = true
}

variable "ami_id" {
  description = "AMI ID to use for EC2 instances"
  type        = string
  default     = "ami-0c02fb55956c7d316"
}

variable "key_name" {
  description = "Key pair name for SSH access"
  type        = string
  default     = "my-key"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.10.0.0/16"
}

variable "public_subnets" {
  description = "List of public Web tier subnet CIDRs"
  type        = list(string)
  default     = ["10.10.0.0/24", "10.10.1.0/24"]
}

variable "private_subnets" {
  description = "List of private tier subnet CIDRs"
  type        = list(string)
  default     = ["10.10.2.0/24", "10.10.3.0/24"]
}

variable "azs" {
  description = "Availability Zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}
