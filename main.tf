resource "google_compute_network" "vpc" {
  name                    = "multi-cloud-vpc"
  auto_create_subnetworks = true
}

resource "google_cloud_run_v2_service" "app" {
  name     = "multi-cloud-app"
  location = var.region

  template {
    containers {
      image = "gcr.io/cloudrun/hello"
    }
  }
}

resource "google_cloud_run_v2_service_iam_member" "public_access" {
  location = google_cloud_run_v2_service.app.location
  name     = google_cloud_run_v2_service.app.name
  role     = "roles/run.invoker"
  member   = "allUsers"
}

resource "google_secret_manager_secret" "app_config" {
  secret_id = "multi-cloud-app-config"

  replication {
    auto {}
  }
}
