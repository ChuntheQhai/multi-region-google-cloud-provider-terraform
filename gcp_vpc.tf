resource "google_compute_network" "vpc_network" {
  name                            = "vpc-network"
  auto_create_subnetworks         = false
  routing_mode                    = "REGIONAL"
  delete_default_routes_on_create = false
}

resource "google_compute_subnetwork" "vpc_subnetwork" {
  for_each = local.regions_subnet

  name          = "subnet-${each.key}"
  region        = each.key
  ip_cidr_range = each.value.subnet_address
  network       = google_compute_network.vpc_network.id
}


data "google_compute_zones" "available_zone" {
  for_each = local.regions_subnet
  region   = each.key
}
