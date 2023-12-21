
locals {
  vpc_name     = "patroller-vpc"
  faith_region = "us-east1"
  useast1_cidr = "11.1.0.0/16"
  boot_image   = "debian-cloud/debian-11"
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

module "instance" {
  source                = "./module-computeinstance"
  instance_name         = "faith-pocketbase"
  instance_machine_type = "e2-micro"
  instance_zone         = "${local.faith_region}-b"
  instance_boot_image   = local.boot_image
  instance_subnetwork   = module.subnet.name
  vpc = local.vpc_name
}