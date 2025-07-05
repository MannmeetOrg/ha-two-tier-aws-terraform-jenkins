variable "aws_region" { default = "us-east-1" }
variable "aws_profile" { default = "default" }

variable "db_username" {
  description = "Database username"
  type        = string
}

variable "jenkins_instance_type" {
  description = "jenkins_instance_type"
  type        = string
}

variable "jenkins_key_pair" {
  description = "Key pair name for Jenkins server"
  type        = string
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

variable "ami_id" {
  description = "AMI ID for EC2"
  type        = string
}

variable "key_name" {
  description = "SSH key name"
  type        = string
}

variable "instance_type" {
  description = "Instance type for general EC2 instances"
  type        = string
}

variable "cidr" {
  description = "VPC CIDR block"
  type        = string
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
