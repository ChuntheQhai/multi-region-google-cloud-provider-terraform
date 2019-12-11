resource "google_compute_health_check" "lb_health_check" {
  name                = "backend-service-health-check"
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

resource "google_compute_backend_service" "default" {
  name          = "backend-service"
  health_checks = [google_compute_health_check.lb_health_check.self_link]

  dynamic "backend" {
    for_each = local.regions_subnet

    content {
      group = google_compute_region_instance_group_manager.default[backend.key].instance_group
    }
  }
}

resource "google_compute_url_map" "default" {
  name            = "url-map"
  default_service = google_compute_backend_service.default.self_link
}

resource "google_compute_target_http_proxy" "default" {
  name    = "target-proxy"
  url_map = google_compute_url_map.default.self_link
}

resource "google_compute_global_forwarding_rule" "default" {
  name       = "global-rule"
  target     = google_compute_target_http_proxy.default.self_link
  port_range = 80
}
