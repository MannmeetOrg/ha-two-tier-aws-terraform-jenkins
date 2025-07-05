
module "vpc" {
  source          = "../modules/vpc"
  cidr            = "10.10.0.0/16"
  public_subnets  = ["10.10.0.0/24", "10.10.1.0/24"]
  private_subnets = ["10.10.2.0/24", "10.10.3.0/24"]
  azs             = ["us-east-1a", "us-east-1b"]
}

module "bastion" {
  source              = "../modules/bastion"
  ami_id              = "ami-0c02fb55956c7d316"  # Amazon Linux 2
  instance_type       = "t2.micro"
  key_name            = "my-key"
  subnet_id           = module.vpc.public_subnet_ids[0]
  security_group_ids  = [module.security_groups.bastion_sg_id]
}

module "alb" {
  source              = "../modules/alb"
  subnet_ids          = module.vpc.public_subnet_ids
  security_group_ids  = [module.security_groups.alb_sg_id]
}

module "asg" {
  source              = "../modules/asg"
  ami_id              = var.ami_id
  instance_type       = var.instance_type
  user_data_file      = file("../modules/asg/userdata.sh")
  key_name            = var.key_name
  subnet_ids          = module.vpc.private_subnet_ids
  security_group_ids  = [module.security_groups.asg_sg_id]
}

module "rds" {
  source              = "../modules/rds"
  instance_type       = var.instance_type
  db_username         = var.db_username
  db_password         = var.db_password
  subnet_ids          = module.vpc.private_subnet_ids
  security_group_ids  = [module.security_groups.rds_sg_id]
}

module "security_groups" {
  source = "../modules/security_groups"

  vpc_id     = module.vpc.vpc_id

  # alb_ports  = [80, 443]       # Public traffic to ALB (HTTP, HTTPS)
  # asg_ports  = [80, 22]        # Internal traffic to EC2 instances, plus SSH if needed
  # rds_ports  = [3306]          # MySQL access from app tier
}

