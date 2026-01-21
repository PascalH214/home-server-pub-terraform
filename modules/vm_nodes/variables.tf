variable "gateway" {
  type        = string
  default     = "192.168.178.1"
  description = "Default gateway IP address for VMs"
}

variable "subnet" {
  type        = string
  default     = "24"
  description = "Subnet mask in CIDR notation for VM IP addresses"
}

variable "proxmox_node" {
  type        = string
  default     = "pve"
  description = "Proxmox host node name where VMs will be deployed"
}

variable "proxmox_template_id" {
  type        = number
  default     = 999
  description = "VM ID of the Proxmox template to clone from"
}

variable "proxmox_vm_id" {
  type        = string
  description = "Proxmox vm-id"
}

variable "proxmox_vm_name" {
  type        = string
  description = "Proxmox vm-name"
}

variable "proxmox_vm_cores" {
  type        = number
  default     = 2
  description = "Cores of vm"
}

variable "proxmox_vm_ipv4_address" {
  type        = string
  description = "Proxmox vm-ipv4"
}

variable "proxmox_vm_memory" {
  type        = number
  default     = 4096
  description = "Amount of memory (in MB) to allocate to each VM"
}

variable "proxmox_datastore_id" {
  type        = string
  default     = "local-lvm"
  description = "Datastore ID where VM disks will be created"
}

variable "proxmox_disk_interface" {
  type        = string
  default     = "scsi0"
  description = "Disk interface type for VM disks"
}

variable "proxmox_disk_size" {
  type        = string
  default     = "16"
  description = "Disk size (in GB) for VM root disks"
}

variable "proxmox_disk_cache_type" {
  type        = string
  default     = "none"
  description = "Type of cache for vm"
}

variable "ssh_local_public_key" {
  type        = string
  description = "SSH public key for local user access to VMs"
}

variable "proxmox_vm_username" {
  type        = string
  description = "Username of vm-user"
  default     = "ubuntu"
}

variable "proxmox_vm_password" {
  type        = string
  sensitive   = true
  description = "Password of vm-user"
  default     = "ubuntu"
}
