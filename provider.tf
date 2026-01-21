terraform {
  required_version = "1.14.3"
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.86.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
    }
  }
}
provider "proxmox" {
  endpoint            = var.proxmox_endpoint
  api_token           = "${var.proxmox_token_id}=${var.proxmox_token_secret}"
  insecure            = true
  ssh {
    agent    = true
    username = var.proxmox_ssh_user
  }
}
