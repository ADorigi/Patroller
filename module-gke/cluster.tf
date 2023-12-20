resource "google_container_cluster" "gke-cluster" {
  name     = var.gke-cluster-name
  location = var.gke-zone

  network    = var.gke-network
  subnetwork = var.gke-subnetwork

  remove_default_node_pool = true
  initial_node_count       = 1
  networking_mode          = var.gke-cluster-networking-mode

  ip_allocation_policy {
    cluster_secondary_range_name  = var.cluster-range-name
    services_secondary_range_name = var.services-range-name
  }
}