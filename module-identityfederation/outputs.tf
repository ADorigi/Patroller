output "service_account_email" {
  description = "Service Account used by GitHub Actions"
  value       = google_service_account.service_account.email
}

output "google_iam_workload_identity_pool_provider_name" {
  description = "Workload Identity Pood Provider ID"
  value       = google_iam_workload_identity_pool_provider.identity_pool_provider.name
}