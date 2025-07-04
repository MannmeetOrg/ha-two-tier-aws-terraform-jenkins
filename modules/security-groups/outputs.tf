# modules/security-groups/outputs.tf
output "alb_sg_id" {
  value = aws_security_group.alb_sg.id
}

output "asg_sg_id" {
  value = aws_security_group.asg_sg.id
}

output "rds_sg_id" {
  value = aws_security_group.rds_sg.id
}


output "bastion_sg_id" {
  value = aws_security_group.bastion.id
}