# Multi-Cloud Terraform Deployer

A Terraform-based infrastructure project that provisions and manages cloud resources across providers, starting with GCP and designed to extend to AWS.

## Project Goal

To demonstrate multi-cloud infrastructure design, environment separation, and CI automation using Terraform.

## Architecture

* GCP VPC Network
* Cloud Run service (public endpoint)
* IAM configuration (public access)
* Secret Manager for app configuration

## Features

* Multi-environment support (`dev` / `prod`)
* Infrastructure as Code using Terraform
* GitHub Actions CI pipeline (init + validate)
* Modular structure for multi-cloud expansion
* AWS provider stub (ready for future integration)

## Tech Stack

* Terraform
* Google Cloud Platform (GCP)
* GitHub Actions

## Environments

* `environments/dev.tfvars`
* `environments/prod.tfvars`

## CI Pipeline

Automatically runs:

* `terraform init`
* `terraform validate`

## Future Improvements

* Add AWS infrastructure deployment
* Introduce Terraform modules
* Add secure CI authentication (OIDC)
* Expand to multi-region deployments

## Key Learning Outcomes

* Multi-cloud architecture design
* Terraform workflow (plan/apply/state)
* CI/CD integration for infrastructure
* Environment-based deployments

