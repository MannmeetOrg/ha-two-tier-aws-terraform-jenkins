## modules/rds/outputs.tf
output "rds_endpoint" { value = aws_db_instance.app.endpoint }
output "rds_identifier" { value = aws_db_instance.app.id }