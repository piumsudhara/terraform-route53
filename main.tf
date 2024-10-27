module "vpc" {
  source               = "./modules/vpc"
  vpc_name             = var.vpc_name
  aws_region           = var.aws_region
  vpc_cidr_block       = var.vpc_cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames
  aws_azs              = var.aws_azs
}

module "ec2" {
  source           = "./modules/ec2"
  ec2_name         = var.ec2_name
  instance_ami     = var.instance_ami
  instance_type    = var.instance_type
  instance_key     = var.instance_key
  user_data_file   = var.user_data_file
  sg_ingress_ports = var.sg_ingress_ports
  vpc_id           = module.vpc.vpc_id
  private_subnets  = module.vpc.private_subnets
  depends_on       = [module.vpc]
}

module "alb" {
  source         = "./modules/alb"
  aws_region     = var.aws_region
  aws_azs        = var.aws_azs
  domain_name    = var.domain_name
  vpc_id         = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
  instance_ids   = module.ec2.instance_ids
}
