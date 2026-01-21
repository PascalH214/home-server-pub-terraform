locals {
  tmuxinator_project_file_content = templatefile(
    "${var.path_template_dir}/tmuxinator.yml.tpl",
    {
      proxmox_vm_username = var.proxmox_vm_username
      vms                 = var.nodes
    }
  )

  ansible_hosts_file_content = templatefile(
    "${var.path_template_dir}/ansible_hosts.tpl",
    {
      vms = var.nodes
    }
  )
  script_discover_nodes = templatefile(
    "${var.path_template_dir}/discover_nodes.sh.tpl",
    {
      vms         = var.nodes
      known_hosts = var.known_hosts
    }
  )
}

resource "local_file" "tmuxinator_project_file" {
  filename = "../.tmuxinator.yml"
  content  = local.tmuxinator_project_file_content
}

resource "local_file" "ansible_hosts" {
  filename = "../ansible/inventory"
  content  = local.ansible_hosts_file_content
}

resource "local_file" "script_discover_nodes" {
  filename        = "${var.path_filled_dir}/discover_nodes.sh"
  content         = local.script_discover_nodes
  file_permission = "0755"
}
