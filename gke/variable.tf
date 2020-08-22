variable "project" { 
  default = "poc-sed-shared-jetstream-sb"
}

variable "region" { 
  default = "us-central1"
}

variable "zone" { 
  default = "us-central1-c"
}

variable "cidr" { 
  default = "10.0.0.0/16" 
}

variable "gke_username" {
  default     = "gke"
  description = "gke username"
}

variable "gke_password" {
  default     = "Iamgoogle12345678"
  description = "gke password"
}

variable "gke_num_nodes" {
  default     = 3
  description = "number of gke nodes"
}

variable "vpc" {
  default = "myvpc-network"
}

variable "subnet" {
  default = "subnet-01"
}

variable "subnet1" {
  default = "subnet-02"
}

variable "cluster" {
  default = "mygke-cluster"
}
