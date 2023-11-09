resource "google_iam_workload_identity_pool" "identity-pool" {
  workload_identity_pool_id = var.workload_identity_pool_id
  display_name              = var.idenity_pool_name
  description               = var.idenity_pool_description 
  disabled                  = false
}
