terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.50"
    }
  }
}

# The API token is never written in the code: set it in terraform.tfvars
# (ignored by git) or with TF_VAR_proxmox_api_token.
provider "proxmox" {
  endpoint  = var.proxmox_endpoint
  api_token = var.proxmox_api_token
  insecure  = true # self-signed certificate in the lab
}
