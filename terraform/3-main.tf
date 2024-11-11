resource "google_compute_network" "this" {
  name = "main"
}

resource "google_compute_subnetwork" "public" {
  name          = "public"
  network       = google_compute_network.this.id
  ip_cidr_range = "10.0.1.0/24"
  region        = var.region
}

resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh"
  network = google_compute_network.this.id

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_instance" "public" {
  count        = var.vm_count
  name         = "public-vm-${count.index + 1}"
  machine_type = "e2-medium"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "projects/debian-cloud/global/images/debian-12-bookworm-v20241009"
    }
  }

  network_interface {
    network    = google_compute_network.this.id
    subnetwork = google_compute_subnetwork.public.id
    access_config {}
  }

  metadata = {
    ssh-keys = "${var.gce_ssh_user}:${file(var.ssh_key)}"
  }
}
