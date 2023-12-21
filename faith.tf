
locals {
  vpc_name     = "patroller-vpc"
  faith_region = "us-east1"
  useast1_cidr = "11.1.0.0/16"
}


module "subnet" {
  source                   = "./module-subnet"
  subnet_name              = "subnet-${local.faith_region}"
  ip_cidr_range            = local.useast1_cidr
  region                   = local.faith_region
  vpc_name                 = local.vpc_name
  private_ip_access        = "false"
  secondary_ip_range_names = []
  secondary_ip_ranges      = []
}