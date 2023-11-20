resource "google_service_account" "gke-sa" {
  account_id   = var.service_account_id
  display_name = var.service_account_display_name
}

data "google_project" "project" {
}

resource "google_project_iam_member" "gke-sa-roles" {
  project = data.google_project.project.project_id
  for_each = {
    for role in var.service_account_roles : role => role
  }
  role   = each.value
  member = "serviceAccount:${google_service_account.gke-sa.email}"
  depends_on = [
    google_service_account.gke-sa
  ]
}
