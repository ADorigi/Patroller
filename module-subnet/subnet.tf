resource "google_compute_subnetwork" "subnet" {
  name                     = var.subnet_name
  ip_cidr_range            = var.ip_cidr_range
  region                   = var.region
  network                  = var.vpc_name
  private_ip_google_access = var.private_ip_access

  dynamic "secondary_ip_range" {
    for_each = zipmap(var.secondary_ip_range_names, var.secondary_ip_ranges)
    content {
      range_name    = secondary_ip_range.key
      ip_cidr_range = secondary_ip_range.value
    }
  }
}