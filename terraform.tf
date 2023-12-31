terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0" # OIDC https://github.com/hashicorp/terraform-provider-google/releases/tag/v3.61.0
    }
  }

  backend "gcs" {
    bucket = "agile-tangent-terraform" # need to update with the bucket name
    prefix = "state/"
  }
}

provider "google" {
  project = "agile-tangent-401105"
  region  = "northamerica-northeast2"
}