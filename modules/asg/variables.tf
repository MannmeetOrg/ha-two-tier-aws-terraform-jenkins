## modules/asg/variables.tf
variable "ami_id" {}
variable "instance_type" {}
variable "user_data_file" {}
variable "key_name" {}
variable "security_group_ids" { type = list(string) }
variable "subnet_ids" { type = list(string) }