data "google_compute_image" "instance_image" {
  name = "nginx-image-template"
  #   project = local.project_name
}

resource "google_compute_instance_template" "default" {
  for_each     = local.regions_subnet
  machine_type = "n1-standard-1"

  region = each.key
  disk {
    source_image = data.google_compute_image.instance_image.self_link
  }

  network_interface {
    network    = google_compute_network.vpc_network.self_link
    subnetwork = google_compute_subnetwork.vpc_subnetwork[each.key].self_link
    access_config {}
  }

  metadata_startup_script = templatefile("${path.module}/ecs_info.tmpl",
    {
      region = each.key
    }
  )
}
