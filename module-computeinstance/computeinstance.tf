# Create a single Compute Engine instance
resource "google_compute_instance" "default" {
  name         = var.instance_name 
  machine_type = var.instance_machine_type 
  zone         = var.instance_zone 
  tags         = ["ssh"]

  boot_disk {
    initialize_params {
      image = var.instance_boot_image 
    }
  }

  network_interface {
    subnetwork = var.instance_subnetwork 

    access_config {
      # Include this section to give the VM an external IP address
    }
  }
}

resource "google_compute_firewall" "ssh" {
  name = "allow-ssh"
  allow {
    ports    = ["22"]
    protocol = "tcp"
  }
  direction     = "INGRESS"
  network       = var.vpc
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh"]
}