resource "aws_instance" "jenkins" {
  ami                         = var.jenkins_ami_id
  instance_type               = var.jenkins_instance_type
  subnet_id                   = var.jenkins_subnet_id
  associate_public_ip_address = true
  key_name                    = var.jenkins_key_pair
  vpc_security_group_ids      = [var.jenkins_sg_id]
  user_data = file("${path.module}/jenkins/bootstrap.sh")

  tags = {
    Name = "jenkins-server"
  }
}
