output "cloud_run_service_url" {
  description = "Public URL of the deployed Cloud Run service"
  value       = google_cloud_run_service.app.status[0].url
}

output "vpc_name" {
  description = "Name of the deployed VPC"
  value       = google_compute_network.vpc.name
}