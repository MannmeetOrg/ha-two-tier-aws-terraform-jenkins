output "jenkins_public_ip" {
  value = aws_instance.jenkins.public_ip
}

output "jenkins_ami_id" {
  value = aws_instance.jenkins.id
}

output "jenkins_subnet_id" {
  value = aws_instance.jenkins.subnet_id
}

output "jenkins_sg_id" {
  value = aws_instance.jenkins.security_groups
}


output "jenkins_key_pair" {
  value = aws_instance.jenkins.key_name
}
