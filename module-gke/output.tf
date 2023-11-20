output "service-account-id" {
  value = google_service_account.gke-sa.account_id
}

output "service-account-name" {
  value = google_service_account.gke-sa.name
}

output "service-account-email" {
  value = google_service_account.gke-sa.email
}

output "gke-cluster-id" {
  value = google_container_cluster.gke-cluster.id
}

output "gke-cluster-name" {
  value = google_container_cluster.gke-cluster.name
}

output "gke-cluster-endpoint" {
  value = google_container_cluster.gke-cluster.name
}

output "gke-node-pool-name" {
  value = google_container_node_pool.gke-node-pool.name
}