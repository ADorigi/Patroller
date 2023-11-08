resource "google_artifact_registry_repository" "artifact-registry" {
  location      = var.region
  repository_id = var.repository-id
  description   = var.description
  format        = var.format
}