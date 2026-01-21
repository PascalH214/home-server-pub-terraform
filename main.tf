module "vm_nodes" {
  for_each = var.nodes

  source = "./modules/vm_nodes"

  ssh_local_public_key = data.local_file.ssh_public_key.content

  proxmox_vm_id           = each.value.id
  proxmox_vm_name         = each.value.name
  proxmox_vm_cores        = each.value.cores
  proxmox_vm_ipv4_address = each.value.address
  proxmox_disk_size       = each.value.disk_size
  proxmox_disk_cache_type = each.value.cache_type
  proxmox_vm_memory       = each.value.memory
}

resource "null_resource" "local-exec" {
  depends_on = [module.vm_nodes]

  provisioner "local-exec" {
    command = "${var.path_filled_dir}/discover_nodes.sh"
  }
}
