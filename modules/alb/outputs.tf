## modules/alb/outputs.tf
output "alb_arn" { value = aws_lb.app.arn }
output "alb_dns_name" { value = aws_lb.app.dns_name }