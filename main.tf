provider "google" {
  project = var.project
  region  = var.region
  credentials = "/home/cloud_user/tf/t.json"
  zone    = var.zone
}


module "network" {
  source  = "terraform-google-modules/network/google"

  network_name = "myvpc-network"
  project_id   = var.project

  subnets = [
    {
      subnet_name   = "subnet-01"
      subnet_ip     = "10.10.10.0/24"
      subnet_region = var.region

    },
 
   {
     subnet_name   = "subnet-02"
      subnet_ip     = "10.10.20.0/24"
      subnet_region = var.region
   }
   
  ]

  secondary_ranges = {
    subnet-01 = [
    {
     range_name    = "subnet-01-secondary-01"
     ip_cidr_range = "192.168.64.0/24"
    }
    ]
    subnet-02 = []
  }
}

module "network_routes" {
  source  = "terraform-google-modules/network/google//modules/routes"
  network_name = module.network.network_name
  project_id   = var.project

   routes = [
         {
             name                   = "egress-internet"
             description            = "route through IGW to access internet"
             destination_range      = "0.0.0.0/0"
             tags                   = "egress-inet"
             next_hop_internet      = "true"
         },

     ]
  }
module "network_fabric-net-firewall" {
  source  = "terraform-google-modules/network/google//modules/fabric-net-firewall"
  project_id              = var.project
  network                 = module.network.network_name
  internal_ranges_enabled = true
  internal_ranges         = [var.cidr]

  }

