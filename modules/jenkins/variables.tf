variable "ami_id" {
  type        = string
  description = "AMI ID for Jenkins EC2"
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "Instance type for Jenkins"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID for Jenkins EC2"
}

variable "key_name" {
  type        = string
  description = "EC2 Key pair name"
}

variable "security_group_id" {
  type        = string
  description = "Security Group ID for Jenkins EC2"
}