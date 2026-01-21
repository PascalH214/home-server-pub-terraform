resource "proxmox_virtual_environment_vm" "vm_nodes" {
  vm_id     = var.proxmox_vm_id
  name      = var.proxmox_vm_name
  node_name = var.proxmox_node

  cpu {
    cores = var.proxmox_vm_cores
  }

  clone {
    vm_id = var.proxmox_template_id
  }

  agent {
    enabled = true
  }

  memory {
    dedicated = var.proxmox_vm_memory
    floating  = var.proxmox_vm_memory * 0.5
  }

  disk {
    datastore_id = var.proxmox_datastore_id
    interface = var.proxmox_disk_interface
    size = var.proxmox_disk_size

    cache = var.proxmox_disk_cache_type
  }

  initialization {
    ip_config {
      ipv4 {
        address = "${var.proxmox_vm_ipv4_address}/${var.subnet}"
        gateway = var.gateway
      }
    }
    user_account {
      keys = [
        var.ssh_local_public_key
      ]
    }
  }

  provisioner "remote-exec" {
    inline = [
      "echo '${var.proxmox_vm_username}:${var.proxmox_vm_password}' | sudo chpasswd",
      "sudo chage -d 0 ${var.proxmox_vm_username}",
      "sudo rm -f /etc/sudoers.d/90-cloud-init-users",
    ]
    on_failure = continue

    connection {
      host = var.proxmox_vm_ipv4_address
      type = "ssh"
      user = var.proxmox_vm_username
      password = var.proxmox_vm_password
    }
  }
}
