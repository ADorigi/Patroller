service_account_id           = "test-sa"
service_account_display_name = "test"
gke-cluster-name             = "cluster"
gke-cluster-zone             = "northamerica"
gke-node-pool-name           = "node-pool"
gke-node-pool-zone           = "northamerica"
gke-node-pool-machine-type   = "e2"
service_account_roles = [
  "roles/artifactregistry.reader",
  "roles/artifactregistry.writer",
]