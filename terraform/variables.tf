variable "proxmox_endpoint" {
  description = "Proxmox VE API URL"
  type        = string
  default     = "https://192.168.100.2:8006/"
}

variable "proxmox_api_token" {
  description = "API token in the form user@realm!token-id=secret"
  type        = string
  sensitive   = true
}

variable "target_node" {
  description = "Proxmox node where the VMs are created"
  type        = string
  default     = "pve"
}

variable "vm_count" {
  description = "Number of VMs to deploy"
  type        = number
  default     = 2
}
