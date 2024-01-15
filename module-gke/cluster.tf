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


  #   for future reference i made the change here but in the actual cluster,
  #   I made manual changes in the console to reflect this change
  #   In short I manually disabled managed prometheus from the console for swath 
  monitoring_config {
    managed_prometheus {
      enabled = false
    }
  }
}