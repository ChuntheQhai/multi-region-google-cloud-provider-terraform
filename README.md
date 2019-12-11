


# Project tested with

- MacOSX
- Terraform 0.12.16
- Terraform Google Cloud Provider 3.1.0
- Packer 1.4.5

# How to Deploy

a. `terraform init` to install the Terraform GCP packages

b. You can select regions by comment or uncomment list in `gcp_local.tf`

c. Export environment variable using  `export GOOGLE_CREDENTIALS=./gcp-service-account.json`

d. Export your project ID using  `export GOOGLE_PROJECT=YOUR_PROJECT_ID`

e. `terraform apply` and `yes`

After apply complete, you have to wait 5 minutes or more for load balancing IP to work.

