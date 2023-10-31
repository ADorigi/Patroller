resource "google_compute_subnetwork" "public-subnet" {
name = "public_subnet"
ip_cidr_range = "10.2.0.0/16"
region = "northamerica-northeast2"
network = local.vpc_name 
}