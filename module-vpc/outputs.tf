output "vpc_id" {
  value = google_compute_network.vpc_network.id
}

output "name" {
  value = google_compute_network.vpc_network.name
}
