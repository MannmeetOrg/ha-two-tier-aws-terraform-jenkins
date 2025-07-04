variable "ami_id" {
  type        = string
  description = "AMI ID for Jenkins EC2"
  default     = "ami-05ffe3c48a9991133"
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
  default     = "aws-key-pair"
}

variable "security_group_id" {
  type        = string
  description = "Security Group ID for Jenkins EC2"
}