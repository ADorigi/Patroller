resource "google_service_account" "gke-sa" {
  account_id   = var.service_account_id
  display_name = var.service_account_display_name
}