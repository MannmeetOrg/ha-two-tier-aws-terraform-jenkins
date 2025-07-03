## modules/vpc/main.tf
resource "aws_vpc" "main" {
  cidr_block = var.cidr
  tags = { Name = "main-vpc" }
}

resource "aws_subnet" "public" {
  count             = length(var.public_subnets)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnets[count.index]
  availability_zone = element(var.azs, count.index)
  map_public_ip_on_launch = true
  tags = { Name = "public-subnet-${count.index}" }
}

# Define web, app, and db subnets similarly