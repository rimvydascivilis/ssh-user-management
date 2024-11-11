output "public_vms_ips" {
  value = google_compute_instance.public[*].network_interface[0].access_config[0].nat_ip
}

output "private_vms_ips" {
  value = google_compute_instance.public[*].network_interface[0].network_ip
}
