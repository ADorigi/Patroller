resource "google_compute_address" "gke-static-ip" {
  name   = var.static-ip-name
  region = var.gke-region
}