variable "public_key" {
  type    = string
  default = "./data/keys/id.pub"
}

variable "known_hosts" {
  type    = string
  default = "~/.ssh/known_hosts"
}

variable "nodes" {
  type = map(object({
    id              = number
    name            = string
    address         = string
    cores           = optional(number, 3)
    disk_size       = optional(string, "16")
    cache_type      = optional(string, "none")
    memory          = optional(number, 4096)
    ansible_exclude = optional(bool, false)
  }))
  default = {
    "test-vm" = {
      id               = 600
      name             = "test-vm"
      address          = "192.168.178.230"
      cores            = 2
      disk_size        = "24"
      ansible_exclude  = true
    }
    "critical" = {
      id        = 500
      name      = "critical"
      address   = "192.168.178.221"
      disk_size = "64"
      memory    = 3072
    }
    "sensible" = {
      id        = 501
      name      = "sensible"
      address   = "192.168.178.222"
      cores     = 10
      disk_size = "192"
      memory    = 8192
    }
    "media" = {
      id         = 502
      name       = "media"
      address    = "192.168.178.223"
      cores      = 8
      disk_size  = "128"
      memory     = 10240
    }
  }
}

variable "path_template_dir" {
  type        = string
  default     = "./data/templates"
  description = "Path to the directory where templates are stored"
}

variable "path_filled_dir" {
  type        = string
  default     = "./data/filled"
  description = "Path to the directory where filled templates are stored"
}
