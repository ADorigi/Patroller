service_account_id           = "gke-service-account"
service_account_display_name = "Service Account for gke(particularly gke node pool)"
service_account_roles = [
  "roles/artifactregistry.reader",
  "roles/artifactregistry.writer",
]
gke-cluster-name            = "primary-cluster"
gke-zone                    = "northamerica-northeast2-a"
gke-node-pool-name          = "gke-node-pool"
gke-node-pool-machine-type  = "e2-small"
spot-node-pool              = true
gke-cluster-networking-mode = "VPC_NATIVE"
gke-network                 = "test-network"
gke-subnetwork              = "test-subnetwork"
cluster-range-name          = "test-cluster-range"
services-range-name         = "test-services-range"