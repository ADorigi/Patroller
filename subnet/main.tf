
module "subnet-public" {
  source            = "./module-subnet"
  subnet_name       = "public-subnet"
  ip_cidr_range     = "10.0.0.0/16"
  region            = "northamerica-northeast2"
  vpc_name          = "patroller-vpc"
  private_ip_access = "false"
}

module "subnet-private" {
  source            = "./module-subnet"
  subnet_name       = "private-subnet"
  ip_cidr_range     = "10.1.0.0/16"
  region            = "northamerica-northeast2"
  vpc_name          = "patroller-vpc"
  private_ip_access = "true"
}