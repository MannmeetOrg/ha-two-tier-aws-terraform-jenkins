## modules/asg/main.tf
resource "aws_launch_template" "app" {
  name_prefix   = "app-launch-template-"
  image_id      = var.ami_id
  instance_type = var.instance_type
  user_data     = filebase64(var.user_data_file)
  key_name      = var.key_name
  vpc_security_group_ids = var.security_group_ids
}

resource "aws_autoscaling_group" "app" {
  desired_capacity     = 2
  max_size             = 4
  min_size             = 1
  vpc_zone_identifier  = var.subnet_ids
  launch_template {
    id      = aws_launch_template.app.id
    version = "$Latest"
  }
  tag {
    key                 = "Name"
    value               = "app-asg"
    propagate_at_launch = true
  }
}