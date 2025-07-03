resource "aws_instance" "jenkins" {
    ami                         = var.ami_id
    instance_type               = var.instance_type
    subnet_id                   = var.subnet_id
    associate_public_ip_address = true
    key_name                    = var.key_name
    vpc_security_group_ids      = [var.security_group_id]
    user_data                   = file("${path.module}/../jenkins/bootstrap.sh")

  tags = {
    Name = "jenkins-server"
 }