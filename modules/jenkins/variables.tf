variable "jenkins_ami_id" {
  description = "Jenkins AMI ID"
  type        = string
  default     = "ami-05ffe3c48a9991133"
}

variable "jenkins_instance_type" {
  description = "Instance type for Jenkins server"
  type        = string
  default     = "t3.micro"
}

variable "jenkins_subnet_id" {
  description = "Subnet ID for Jenkins server"
  type        = string
}

variable "jenkins_sg_id" {
  description = "Security group ID for Jenkins server"
  type        = string
}

variable "jenkins_key_pair" {
  description = "Key pair name for Jenkins server"
  type        = string
}