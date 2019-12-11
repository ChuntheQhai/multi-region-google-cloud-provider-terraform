resource "google_compute_health_check" "igm_autohealing" {
  name                = "autohealing-health-check"
  check_interval_sec  = 10
  timeout_sec         = 5
  healthy_threshold   = 1
  unhealthy_threshold = 5

  http_health_check {
    port_name    = "http-port"
    port         = 80
    request_path = "/"
  }
}

resource "google_compute_region_instance_group_manager" "default" {
  for_each = local.regions_subnet

  name               = "instance-group-manager-${each.key}"
  base_instance_name = "igm-${each.key}"
  region             = each.key
  version {
    name              = "instance-v1"
    instance_template = google_compute_instance_template.default[each.key].self_link
  }

  update_policy {
    type                  = "PROACTIVE"
    minimal_action        = "REPLACE"
    max_surge_fixed       = length(data.google_compute_zones.available_zone[each.key])
    max_unavailable_fixed = 0
    min_ready_sec         = 10
  }

  auto_healing_policies {
    health_check      = google_compute_health_check.igm_autohealing.self_link
    initial_delay_sec = 60
  }
}

resource "google_compute_region_autoscaler" "asg" {
  for_each = local.regions_subnet

  name   = "autoscaler"
  region = each.key
  target = google_compute_region_instance_group_manager.default[each.key].self_link

  autoscaling_policy {
    max_replicas = 5
    min_replicas = 1

    cooldown_period = 60

    load_balancing_utilization {
      target = 0.7
    }
  }
}
