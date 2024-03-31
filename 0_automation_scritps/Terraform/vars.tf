variable "proxmox_host" {
  default = "prod-atlas"
}

variable "template_name" {
  default = "debian-12-cloud-img"
}

variable "  " {
  default = "mistyops"
}

variable "ssh_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCCFyBRbYik4yd9CzVmY0PJSKXukXwYPBkARyN3TipRjJffaF0Nfqsfl4nPQ6D3ElhoheDB8ecHjDGIZIQklmFGGKCOQqyiFoSog1Tc/FUhEvdwfW5toVEJ5alfSl3wZy7TSkBaRxqdRwfwS+lmkzCeHCQFeQL2KwPGO0b1ynXAakHg1N70XqhPztnYbz/7QqqtKuwM7GaP6Sy+6EYF4ABvjv4lQnby9/3kMuAXTNpM5GXLNhItlm9k0jtB0JQiuIeSIPZ0GUja1+EUzUgP/I1mW1oEvAiGynliH9Nw4LDjEFOmip8vosiBWO6d97P+38+f9COgok91RSJTSjom7AId misty@mistysnowrealms.net"
  sensitive = true
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

