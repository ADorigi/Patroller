resource "google_container_node_pool" "gke-node-pool" {
  name       = var.gke-node-pool-name
  location   = var.gke-zone
  cluster    = google_container_cluster.gke-cluster.name
  node_count = 1

  node_config {
    machine_type = var.gke-node-pool-machine-type
    spot         = var.spot-node-pool

    labels = {
      resource = "kubernetes"
      cluster  = var.gke-cluster-name
    }

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.gke-sa.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}