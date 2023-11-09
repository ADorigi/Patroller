module "swath_identity_pool" {
  source                    = "./module-identityfederation"
  workload_identity_pool_id = "swath-idenity-pool-id"
  idenity_pool_name         = "Swath Github actions pool"
  idenity_pool_description  = "Identity pool to allow swath github actions to access gcp resources"
  identity_pool_provider_id = "swath-pool-provider-id"
  identity_pool_provider_attributes = {
    "google.subject"  = "assertion.sub",
    "attribute.actor" = "assertion.actor",
    "attribute.aud"   = "assertion.aud"
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