variable "proxmox_host" {
  default = "atlas"
}
variable "template_name" {
  default = "debian12-cloud"
}

variable "ssh_key" {
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPXNpIsGHVA6KAAe8wM9r8sPURxPl/mXOFgY5PLrR7jO debian@mistysnowrealms.net"
}