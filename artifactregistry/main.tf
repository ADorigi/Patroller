module "artifact-registry" {
  source        = "./module-artifactregistry"
  repository-id = "container-registry"
  region        = "northamerica-northeast2"
  description   = "artifact registry for swath"
  format        = "DOCKER"
}