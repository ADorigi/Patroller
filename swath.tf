module "artifact-registry" {
  source        = "./module-artifactregistry"
  repository-id = "container-registry"
  region        = "northamerica-northeast2"
  description   = "artifact registry for swath"
  format        = "DOCKER"
}

module "swath_identity_pool" {
  source                    = "./module-identityfederation"
  workload_identity_pool_id = "swath-gh-idenity-pool"
  idenity_pool_name         = "Swath Github actions pool"
  idenity_pool_description  = "Identity pool to allow swath github actions to access gcp resources"
  identity_pool_provider_id = "swath-pool-provider-id"
  identity_pool_provider_attributes = {
    "google.subject"       = "assertion.sub",
    "attribute.actor"      = "assertion.actor",
    "attribute.aud"        = "assertion.aud",
    "attribute.repository" = "assertion.repository"
  }
  identity_pool_provider_issuer_uri = "https://token.actions.githubusercontent.com"
  service_account_id                = "swath-service-account"
  service_account_display_name      = "service account for swath github actions"
  service_account_roles = [
    "roles/artifactregistry.reader",
    "roles/artifactregistry.writer",
  ]
  repository_name = "ADorigi/Swath"
}

module "google-network" {
  source       = "./module-vpc"
  vpc_name     = "patroller-vpc"
  routing_mode = "GLOBAL"
  mtu          = 1460
}


module "subnet-public" {
  source            = "./module-subnet"
  subnet_name       = "public-subnet"
  ip_cidr_range     = "10.0.0.0/16"
  region            = "northamerica-northeast2"
  vpc_name          = "patroller-vpc"
  private_ip_access = "false"
}

module "subnet-private" {
  source            = "./module-subnet"
  subnet_name       = "private-subnet"
  ip_cidr_range     = "10.1.0.0/16"
  region            = "northamerica-northeast2"
  vpc_name          = "patroller-vpc"
  private_ip_access = "true"
}

module "gke-cluster" {

  source                       = "./module-gke"
  service_account_id           = "gke-service-account"
  service_account_display_name = "Service Account for gke(particularly gke node pool)"
  gke-cluster-name             = "primary-cluster"
  gke-zone                     = "northamerica-northeast2-a"
  gke-region                   = "northamerica-northeast2"
#   gke-cluster-networking-mode  = "VPC_NATIVE"
  gke-node-pool-name           = "gke-node-pool"
  gke-node-pool-machine-type   = "e2-small"
  spot-node-pool               = true
  service_account_roles = [
    "roles/artifactregistry.reader",
    "roles/artifactregistry.writer",
  ]
  static-ip-name = "gke-static-ip"
}