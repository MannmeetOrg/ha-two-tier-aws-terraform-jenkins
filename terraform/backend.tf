terraform {
  backend "s3" {
    bucket = "terraform-state-twotieraws"
    key    = "jenkins/terraform.tfstate"
    region = "us-east-1"
  }
}