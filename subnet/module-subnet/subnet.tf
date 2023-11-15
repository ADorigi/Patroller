resource "google_compute_subnetwork" "public-subnet" {
  name                     = var.subnet_name
  ip_cidr_range            = var.ip_cidr_range
  region                   = var.region
  network                  = var.vpc_name
  private_ip_google_access = var.private_ip_access
}