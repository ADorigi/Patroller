resource "google_compute_router" "router" {
  name    = var.router_name
  region  = var.region
  network = var.network-id
}
