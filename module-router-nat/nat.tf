resource "google_compute_router_nat" "router-nat" {
  name   = var.router_nat_name
  router = var.router_name
  region = var.region

  source_subnetwork_ip_ranges_to_nat = var.nat_ip_ranges         # "ALL_SUBNETWORKS_ALL_IP_RANGES"
  nat_ip_allocate_option             = var.nat_allocation_option # "AUTO_ONLY" 

}