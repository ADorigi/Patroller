resource "google_container_cluster" "gke-cluster" {
  name     = var.gke-cluster-name
  location = var.gke-zone

  remove_default_node_pool = true
  initial_node_count       = 1
  networking_mode          = var.gke-cluster-networking-mode
}