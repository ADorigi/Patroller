service_account_id           = "gke-service-account"
service_account_display_name = "Service Account for gke(particularly gke node pool)"
gke-cluster-name             = "primary-cluster"
gke-zone                     = "northamerica-northeast2-a"
gke-region                   = "northamerica-northeast2"
gke-node-pool-name           = "gke-node-pool"
gke-node-pool-machine-type   = "e2-small"
service_account_roles = [
  "roles/artifactregistry.reader",
  "roles/artifactregistry.writer",
]
static-ip-name          = "gke-static-ip"
spot-node-pool          = true
gke-cluster-networking-mode = "VPC_NATIVE"