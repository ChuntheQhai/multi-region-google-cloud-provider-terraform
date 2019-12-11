provider "google" {
  #   credentials = local.credential
  #   project     = local.project_name
}

locals {
  #   project_name = "MY_PROJECT_ID"
  #   credentials  = "${file("sample_crendential.json")}"
  regions_subnet = {
    "us-central1" = {
      subnet_address = "10.148.0.0/20"
    },
    "europe-west1" = {
      subnet_address = "10.152.0.0/20"
    },
    "us-west1" = {
      subnet_address = "10.158.0.0/20"
    },
    "asia-east1" = {
      subnet_address = "10.160.0.0/20"
    },
    "us-east1" = {
      subnet_address = "10.162.0.0/20"
    },
    "asia-northeast1" = {
      subnet_address = "10.166.0.0/20"
    },
    "asia-southeast1" = {
      subnet_address = "10.168.0.0/20"
    },
    "us-east4" = {
      subnet_address = "10.170.0.0/20"
    },
    "australia-southeast1" = {
      subnet_address = "10.172.0.0/20"
    },
    "europe-west2" = {
      subnet_address = "10.174.0.0/20"
    },
    "europe-west3" = {
      subnet_address = "10.176.0.0/20"
    },
    "southamerica-east1" = {
      subnet_address = "10.178.0.0/20"
    },
    "asia-south1" = {
      subnet_address = "10.180.0.0/20"
    },
    "northamerica-northeast1" = {
      subnet_address = "10.182.0.0/20"
    },
    "europe-west4" = {
      subnet_address = "10.184.0.0/20"
    },
    "europe-north1" = {
      subnet_address = "10.186.0.0/20"
    },
    "us-west2" = {
      subnet_address = "10.188.0.0/20"
    },
    "asia-east2" = {
      subnet_address = "10.190.0.0/20"
    },
    "europe-west6" = {
      subnet_address = "10.192.0.0/20"
    },
    "asia-northeast2" = {
      subnet_address = "10.194.0.0/20"
    },
  }
}
