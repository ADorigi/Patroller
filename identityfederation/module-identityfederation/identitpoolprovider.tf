resource "google_iam_workload_identity_pool_provider" "identity_pool_provider" {
  workload_identity_pool_id          = google_iam_workload_identity_pool.identity-pool.workload_identity_pool_id
  workload_identity_pool_provider_id = var.identity_pool_provider_id
  attribute_mapping                  = var.identity_pool_provider_attributes
  oidc {
    issuer_uri        = var.identity_pool_provider_issuer_uri
  }
}