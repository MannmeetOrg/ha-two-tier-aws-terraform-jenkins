## modules/vpc/outputs.tf
output "vpc_id" { value = aws_vpc.main.id }
output "public_subnet_ids" { value = aws_subnet.public[*].id }
# Add outputs for web, app, db subnets as needed