## modules/asg/outputs.tf
output "asg_name" { value = aws_autoscaling_group.app.name }

output "ami_id" { value = aws_launch_template.app.image_id}