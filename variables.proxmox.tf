variable "proxmox_endpoint" {
  type = string
  sensitive = true
}

variable "proxmox_token_id" {
  type = string
  sensitive = true
}

variable "proxmox_token_secret" {
  type = string
  sensitive = true
}

variable "proxmox_ssh_user" {
  type = string
  default = "terraform"
}

variable "proxmox_vm_username" {
  type        = string
  default     = "ubuntu"
}
