resource "google_container_cluster" "gke-cluster" {
  name     = var.gke-cluster-name
  location = var.gke-cluster-zone

  remove_default_node_pool = true
  initial_node_count       = 1
}