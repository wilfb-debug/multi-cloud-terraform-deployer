# Multi-Cloud Terraform Deployer

> Infrastructure-as-Code project that provisions GCP resources using Terraform, with CI validation on every push — designed to extend to AWS.

![CI](https://github.com/wilfb-debug/multi-cloud-terraform-deployer/actions/workflows/terraform.yml/badge.svg)
![Terraform](https://img.shields.io/badge/Terraform-1.x-7B42BC?logo=terraform)
![GCP](https://img.shields.io/badge/GCP-Cloud%20Run-4285F4?logo=google-cloud)
![Multi-cloud](https://img.shields.io/badge/Multi--cloud-GCP%20%2B%20AWS%20stub-orange)

---

## What this project does

This project uses Terraform to automatically create and manage cloud infrastructure on Google Cloud Platform (GCP). Instead of clicking through a cloud console, all infrastructure is defined as code — meaning it's repeatable, version-controlled, and reviewable like any other software.

It provisions a VPC network, a Cloud Run service, IAM access rules, and a Secret Manager entry — all from a single `terraform apply`.

---

## Why I built it

To demonstrate how real teams manage cloud infrastructure at scale. Writing infrastructure as code (IaC) is a core skill for cloud and DevOps engineers — this project shows I can do it end-to-end, from writing the config to validating it in CI.

---

## Tech stack

| Tool | Purpose |
|---|---|
| **Terraform** | Define and provision infrastructure as code |
| **Google Cloud Platform** | Cloud provider (VPC, Cloud Run, Secret Manager, IAM) |
| **GitHub Actions** | CI pipeline — validates and lints on every push |
| **tflint** | Terraform linter — catches errors and bad practices before deploy |

---

## What gets provisioned

- **VPC Network** — isolated network for cloud resources
- **Cloud Run Service** — serverless container endpoint (public)
- **IAM Policy** — grants public invoker access to Cloud Run
- **Secret Manager Secret** — placeholder for secure app config

---

## How to run it locally

**Prerequisites:** Terraform installed, GCP project with billing enabled, `gcloud` CLI authenticated.

```bash
# Clone the repo
git clone https://github.com/wilfb-debug/multi-cloud-terraform-deployer.git
cd multi-cloud-terraform-deployer

# Initialise Terraform (downloads providers)
terraform init

# Validate the configuration
terraform validate

# Preview what will be created (dry run — no cost)
terraform plan -var="project_id=YOUR_GCP_PROJECT_ID"

# Deploy (creates real resources)
terraform apply -var="project_id=YOUR_GCP_PROJECT_ID"
```

To use environment-specific variables:
```bash
terraform plan -var-file="environments/dev.tfvars"
```

---

## Project structure

```
.
├── main.tf               # Core infrastructure (VPC, Cloud Run, IAM, Secrets)
├── providers.tf          # GCP provider config + AWS stub (ready to enable)
├── variables.tf          # Input variables (project_id, region)
├── outputs.tf            # Exported values (Cloud Run URL, VPC name)
├── environments/
│   ├── dev.tfvars        # Dev environment variables
│   └── prod.tfvars       # Prod environment variables
└── .github/workflows/
    └── terraform.yml     # CI pipeline (init, fmt, validate, tflint)
```

---

## CI pipeline

Runs automatically on every push to `main` and on pull requests:

| Step | What it does |
|---|---|
| `terraform init` | Downloads providers and sets up the workspace |
| `terraform fmt --check` | Fails if code isn't properly formatted |
| `terraform validate` | Checks for syntax and configuration errors |
| `tflint` | Lints for deprecated resources, bad practices, and provider-specific issues |

---

## What this demonstrates

- **Infrastructure as Code** — all resources defined declaratively, nothing clicked manually
- **Multi-environment design** — separate `dev` and `prod` tfvars with clean variable separation
- **CI for infrastructure** — automated validation pipeline that catches issues before they reach cloud
- **Multi-cloud architecture** — GCP live, AWS provider stubbed and ready to extend
- **GCP services** — practical use of Cloud Run, VPC, IAM, and Secret Manager together

---

## Future improvements

- Enable AWS provider and add equivalent EC2/Lambda resources
- Refactor into reusable Terraform modules
- Add Workload Identity Federation (OIDC) for secure CI authentication without service account keys
- Add `terraform plan` step to CI with output posted as PR comment
