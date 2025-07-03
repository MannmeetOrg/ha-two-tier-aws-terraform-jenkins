module "vpc" {
  source = ".."
}

module "alb" {
  source = ".."
}

module "asg" {
  source = ".."
}

module "rds" {
  source = ".."
}

module "jenkins" {
  source = ".."
}

module "bastion" {
  source = ".."
}
