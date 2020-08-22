provider "google" {
  credentials = file("t.json")
  project     = var.project
  region      = var.region
  version     = "~> 3.1.0"
}
resource "google_container_cluster" "gcp_kubernetes" {
  name               = "${var.cluster}"
  location               = "${var.zone}"
  initial_node_count = "${var.gke_num_nodes}"

  master_auth {
    username = "${var.gke_username}"
    password = "${var.gke_password}}"
  }
  network  = var.vpc
  subnetwork = var.subnet
  
  autoscaling {
    min_node_count = "3"
    max_node_count = "5"
  }

  node_config {
    preemptible  = true
    machine_type = "e2-standard-8"

    metadata = {
      disable-legacy-endpoints = "true"
    }
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

  }
}
