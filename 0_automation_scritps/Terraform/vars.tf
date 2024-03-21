variable "proxmox_host" {
  default = "atlas"
}
variable "template_name" {
  default = "debian12-cloud"
}

variable "ssh_key" {
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPXNpIsGHVA6KAAe8wM9r8sPURxPl/mXOFgY5PLrR7jO debian@mistysnowrealms.net"
}

variable "vm_id" {
  type = list(string)
  default = ["100","101", "102"]
}

variable "vm_hostname" {
  type = list(string)
  default = ["msrl-home-00v","msrl-home-01v", "msrl-home-02v"]
}
   
