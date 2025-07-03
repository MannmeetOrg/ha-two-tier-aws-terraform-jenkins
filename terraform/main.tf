module "jenkins" {
  source              = "../modules/jenkins"
  ami_id              = var.jenkins_ami_id
  instance_type       = var.jenkins_instance_type
  subnet_id           = var.jenkins_subnet_id
  key_name            = var.key_name
  security_group_id   = var.jenkins_sg_id
}

module "vpc" {
  source          = "../modules/vpc"
  cidr            = "10.10.0.0/16"
  public_subnets  = ["10.10.0.0/24", "10.10.1.0/24"]
  web_subnets     = ["10.10.2.0/24", "10.10.3.0/24"]
  app_subnets     = ["10.10.4.0/24", "10.10.5.0/24"]
  db_subnets      = ["10.10.6.0/24", "10.10.7.0/24"]
  azs             = ["us-east-1a", "us-east-1b"]
}

module "security-groups" {
  source  = "../modules/security-groups"
  vpc_id  = module.vpc.vpc_id
}

module "alb" {
  source              = "../modules/alb"
  subnet_ids          = module.vpc.public_subnet_ids
  security_group_ids  = [module.security-groups.alb_sg_id]
}

module "asg" {
  source              = "../modules/asg"
  ami_id              = var.ami_id
  instance_type       = var.instance_type
  user_data_file      = file("../modules/asg/userdata.sh")
  key_name            = var.key_name
  subnet_ids          = module.vpc.app_subnets
  security_group_ids  = [module.security-groups.asg_sg_id]
}

module "rds" {
  source              = "../modules/rds"
  instance_type       = var.instance_type
  db_username         = var.db_username
  db_password         = var.db_password
  subnet_ids          = module.vpc.db_subnet_ids
  security_group_ids  = [module.security-groups.rds_sg_id]
}
module "bastion" {
  source              = "../modules/bastion"
  ami_id              = "ami-0c02fb55956c7d316"  # Amazon Linux 2
  instance_type       = "t2.micro"
  key_name            = "my-key"
  subnet_id           = module.vpc.public_subnet_ids[0]
  security_group_ids  = ["sg-xxxxxxxx"]
}