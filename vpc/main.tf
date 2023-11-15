module "google-network" {
  source       = "./module-vpc"
  vpc_name     = "patroller-vpc"
  routing_mode = "GLOBAL"
  mtu          = 1460
}