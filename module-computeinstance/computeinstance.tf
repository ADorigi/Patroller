# Create a single Compute Engine instance
resource "google_compute_instance" "default" {
  name         = var.instance_name 
  machine_type = var.instance_machine_type 
  zone         = var.instance_zone 

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