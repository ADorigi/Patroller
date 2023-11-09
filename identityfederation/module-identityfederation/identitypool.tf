resource "google_iam_workload_identity_pool" "workload_identity_pool" {
  provider                  = google-beta
  project                   = data.google_project.project.project_id
  workload_identity_pool_id = var.workload_identity_pool_id
  display_name              = var.idenity_pool_name
  description               = var.idenity_pool_description
  disabled                  = false
}
