provider "google" {
  project     = "uplifted-stream-406713"
  region = "europe-west3"
  zone = "europe-west3-c"

}

### NETWORK
resource "google_compute_network" "vpc_network" {
  name = "demo-benchmark-network"
  auto_create_subnetworks = true
}

### FIREWALL
resource "google_compute_firewall" "all" {
  name = "allow-all"
  allow {
    protocol = "tcp"
    ports = ["0-65535"]
  }
  network = google_compute_network.vpc_network.id
  source_ranges = ["0.0.0.0/0"]
}

### Benchmark Client
resource "google_compute_instance" "nginx" {
  name         = "nginx-sut-r1"
  machine_type = "e2-standard-2"
  zone = "europe-west3-c"

  boot_disk {
    initialize_params {
      image = "projects/debian-cloud/global/images/debian-12-bookworm-v20240213"
      size = 10
      type="pd-balanced"
    }
  }

  metadata_startup_script = file("startup_sut.sh")

  network_interface {
    network = google_compute_network.vpc_network.id
    access_config {
      # Include this section to give the VM an external IP address
    }
  }
}


### Benchmark Client
resource "google_compute_instance" "client" {
  name         = "client-r1"
  machine_type = "e2-standard-2"
  zone = "europe-west3-c"

  boot_disk {
    initialize_params {
      image = "projects/debian-cloud/global/images/debian-12-bookworm-v20240213"
      size = 10
      type="pd-balanced"
    }
  }

  metadata_startup_script = file("startup_client.sh")

  network_interface {
    network = google_compute_network.vpc_network.id
    access_config {
      # Include this section to give the VM an external IP address
    }
  }
}
