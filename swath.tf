locals {
  region = "northamerica-northeast2"
  zone   = "northamerica-northeast2-a"
}
module "artifact-registry" {
  source        = "./module-artifactregistry"
  repository-id = "container-registry"
  region        = local.region
  description   = "artifact registry for swath"
  format        = "DOCKER"
}

module "swath_identity_pool" {
  source                    = "./module-identityfederation"
  workload_identity_pool_id = "workload-identity-pool-swath"
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

module "subnet-private" {
  source                   = "./module-subnet"
  subnet_name              = "private-subnet"
  ip_cidr_range            = "10.1.0.0/16"
  region                   = local.region
  vpc_name                 = "patroller-vpc"
  private_ip_access        = "true"
  secondary_ip_range_names = ["pod-range", "service-range"]
  secondary_ip_ranges      = ["10.2.0.0/24", "10.3.0.0/24"]
}

module "router-nat" {
  source                = "./module-router-nat"
  router_name           = "gke-subnet-router"
  region                = local.region
  network-id            = module.google-network.vpc_id
  router_nat_name       = "gke-router-nat"
  nat_ip_ranges         = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  nat_allocation_option = "AUTO_ONLY"

}


module "gke-cluster" {

  source           = "./module-gke"
  gke-cluster-name = "primary-cluster"
  gke-zone         = local.zone
  gke-region       = local.region
  gke-network      = module.google-network.name
  gke-subnetwork   = module.subnet-private.name

}