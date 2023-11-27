resource "google_compute_global_address" "gke-static-ip" {
  name   = var.static-ip-name
}