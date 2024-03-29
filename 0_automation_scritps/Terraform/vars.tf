variable "proxmox_host" {
  default = "atlas"
}
variable "template_name" {
  default = "debian-12-cloud-img"
}

variable "ssh_key" {
  default = "misty@mistysnowrealms.net"
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

variable "vm_ip_creator" {
  default = "172.16.150.252"
}

variable "vm_ip_home" {
  type = list(string)
  default = ["172.16.150.101", "172.16.150.102"]
}

variable "vm_ip_monitor" {
  type = list(string)
  default = ["172.16.150.201"]
}

