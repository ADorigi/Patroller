resource "google_container_node_pool" "gke-node-pool" {
  name       = var.gke-cluster-name
  location   = var.gke-cluster-zone
  cluster    = google_container_cluster.gke-cluster.name
  node_count = 1

  node_config {
    preemptible  = false
    machine_type = var.gke-node-pool-machine-type

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.gke-sa.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}