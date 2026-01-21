data "local_file" "ssh_public_key" {
  filename = var.public_key 
}
