# Deploys lightweight VMs on the Proxmox cluster through the API
resource "proxmox_virtual_environment_vm" "terraform-vm" {
  count     = var.vm_count
  name      = "terraform-vm-${count.index + 1}"
  node_name = var.target_node
  started   = false

  cpu {
    cores = 1
    type  = "qemu64"
  }

  memory {
    dedicated = 512
  }

  network_device {
    bridge = "vmbr0"
  }
}

output "vm_names" {
  value = proxmox_virtual_environment_vm.terraform-vm[*].name
}
