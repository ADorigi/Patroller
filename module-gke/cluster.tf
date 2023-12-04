resource "google_container_cluster" "gke-cluster" {
  name     = var.gke-cluster-name
  location = var.gke-region

  network    = var.gke-network
  subnetwork = var.gke-subnetwork

  enable_autopilot = true
}