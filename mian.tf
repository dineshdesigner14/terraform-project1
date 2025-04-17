module "provider" {
  source = "./modules/provider"
  # pass variables here
}

module "ec2" {
  source = "./modules/ec2"
  # pass variables here
}

module "s3" {
  source = "./modules/s3"
}

module "sg" {
  source = "./modules/sg"
}
module "vpc" {
  source = "./modules/vpc"
  # pass variables here
}

module "iam" {
  source = "./modules/iam"
  # pass variables here
}

module "sns" {
  source = "./modules/sns"
}

module "alb" {
  source = "./modules/alb"
}
module "aws_ebs_volume" {
source = "./modules/ebs"
  
}
