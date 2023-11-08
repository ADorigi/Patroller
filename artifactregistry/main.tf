module "artifact-registry" {
  source      = "./module-artifactregistry"
  region      = "northamerica-northeast2"
  description = "artifact registry for swath"
  format      = "DOCKER"
}