workload_identity_pool_id = "test-idenity-pool"
idenity_pool_name         = "test actions pool"
idenity_pool_description  = "test description"
identity_pool_provider_id = "test-provider-id"
identity_pool_provider_attributes = {
  "google.subject" = "assertion.sub",
}
identity_pool_provider_issuer_uri = "https://token.actions.githubusercontent.com"
service_account_id                = "test-service-account"
service_account_display_name      = "test service account"
service_account_roles = [
  "roles/artifactregistry.reader",
]
repository_name = "ADorigi"