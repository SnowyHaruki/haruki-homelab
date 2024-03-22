variable "proxmox_host" {
  default = "atlas"
}
variable "template_name" {
  default = "debian12-cloud"
}

variable "ssh_key" {
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPXNpIsGHVA6KAAe8wM9r8sPURxPl/mXOFgY5PLrR7jO debian@mistysnowrealms.net"
}

variable "vm_id_home" {
  type = list(string)
  default = ["101","102"]
}

variable "vm_id_monitor" {
  type = list(string)
  default = ["1001"]
}

variable "vm_hostname_home" {
  type = list(string)
  default = ["msrl-home-01v","msrl-home-02v"]
}

variable "vm_hostname_monitor" {
  type = list(string)
  default = ["msrl-monitor-01v"]
}

variable "vm_hostname_dev" {
  type = list(string)
  default = ["dev-01"]
}

variable "vm_hostname_prod" {
  type = list(string)
  default = ["prod-01"]
}

variable "vm_ip_deployer" {
  default = "172.16.150.200"
}

variable "vm_ip_home" {
  type = list(string)
  default = ["172.16.150.101", "172.16.150.102"]
}

variable "vm_ip_monitor" {
  type = list(string)
  default = ["172.16.150.201"]
}

