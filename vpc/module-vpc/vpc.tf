resource "google_compute_network" "vpc_network" {
  name                    = var.vpc_name
  routing_mode            = var.routing_mode
  auto_create_subnetworks = false
}