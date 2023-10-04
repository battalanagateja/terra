module "vpc" {
  source = "../module/vpc"
  region = var.region
  project_name = var.project_name
  vpc_cidr = var.vpc_cidr
  public1_cidr = var.public1_cidr
  availability_zone1 = var.availability_zone1
  public2_cidr = var.public2_cidr
  availability_zone2 = var.availability_zone2
  private1_cidr = var.private1_cidr
  private2_cidr = var.private2_cidr
  sub_rds1 = var.sub_rds1
  sub_rds2 = var.sub_rds2
}
module "nat" {
  source = "../module/nat"
  pub_sub1 = module.vpc.pub_sub1
  pub_sub2 = module.vpc.pub_sub2
  private1 = module.vpc.private1
  private2 = module.vpc.private2
  igw = module.vpc.igw
  vpc = module.vpc.vpc
}
module "sec" {
  source = "../module/sec"
  vpc = module.vpc.vpc
}
module "ec2" {
  source = "../module/ec2"
  ami = var.ami
  instance-type = var.instance-type
  vpc = module.vpc.vpc
  pub_sub1 = module.vpc.pub_sub1
  ec2-sec = module.sec.ec2-sec
  private_sec = module.sec.private_sec
  private1 = module.vpc.private1
  private2 = module.vpc.private2
  
}