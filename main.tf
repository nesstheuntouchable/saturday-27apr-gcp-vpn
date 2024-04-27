terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.25.0"
    }
  }
}

provider "google" {
  # Configuration options
  project     = "fast-cascade-416401"
  region      = "us-central1"
  zone        = "us-central1-a"
  credentials = "fast-cascade-416401-f9a4ee6d81f6.json"
}

resource "google_storage_bucket" "fast-cascade-416401-tbucket-1" {
  name          = "the_force_is_stong_here_bucket"
  location      = "US"
  force_destroy = true

}


resource "google_compute_network" "auto-vpc-tf1" {
  name                    = "auto-vpc-tf1"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "sub-sg" {
  name          = "sub-sg"
  network       = google_compute_network.auto-vpc-tf1.id
  ip_cidr_range = "10.112.1.0/24"
  region        = "asia-northeast1"
}


#resource "google_compute_network" "custom-vpc-tf1" {
#name = "custom-vpc-tf1"
#auto_create_subnetworks = false
#}

output "auto" {
  value = google_compute_network.auto-vpc-tf1.id
}

#output "custom" {
#  value = google_compute_network.custom-vpc-tf1.id
#}
