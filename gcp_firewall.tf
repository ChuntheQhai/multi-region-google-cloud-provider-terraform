
resource "google_compute_firewall" "firewall-http" {
  name    = "firewall-http"
  network = google_compute_network.vpc_network.id

  allow {
    protocol = "tcp"
    ports    = [80]
  }

  allow {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "firewall-ssh" {
  name    = "firewall-ssh"
  network = google_compute_network.vpc_network.id

  allow {
    protocol = "tcp"
    ports    = [22]
  }

  source_ranges = ["0.0.0.0/0"]
}
