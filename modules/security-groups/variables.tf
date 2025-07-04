## modules/security_groups/variables.tf
variable "vpc_id" {
  description = "VPC ID to associate security groups with"
  type        = string
}

variable "alb_ports" {
  description = "List of ports to allow on the ALB"
  type        = list(number)
  default     = [80, 443]
}

variable "asg_ports" {
  description = "List of ports for ASG EC2 instances"
  type        = list(number)
  default     = [80, 22]
}

variable "rds_ports" {
  description = "List of ports for RDS access"
  type        = list(number)
  default     = [3306]
}

