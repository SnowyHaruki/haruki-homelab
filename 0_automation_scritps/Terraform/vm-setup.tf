# Proxmox Full-Clone
# ---
# Create a new VM from a clone


resource "proxmox_vm_qemu" "home" {
    
    count = 2
    target_node = var.proxmox_host

    # VM General Settings
    vmid = var.vm_id_home[count.index]
    name = var.vm_hostname_home[count.index]
    desc = "*Automatically created by Terraform.*<br>Home VM"

    # VM Advanced General Settings
    onboot = true 

    # VM OS Settings
    clone = var.template_name
    full_clone = true

    # VM System Settings
    agent = 1
    
    # VM Hardware Settings
    cores = 4
    sockets = 1
    cpu = "host"
    memory = 4096
    scsihw   = "virtio-scsi-pci"
    boot = "order=scsi0;ide3"
    bootdisk    = "scsi0"
    vga {
        type = "virtio"
        memory = 512
    }

    # VM Disk Settings
    disks {
        ide {
            ide0 {
                disk {
                    size = 2
                    storage = "local-lvm"
                }
            }
        }
        scsi {
            scsi0 {
                disk {
                    size = 5
                    storage = "local-lvm"
                }
            }
        }
    }

    # VM Network Settings
    network {
        model  = "virtio"
        bridge = "vmbr1"
        tag = 150
    }

    # VM Cloud-Init Settings
    os_type = "cloud-init"
    cloudinit_cdrom_storage = "local-lvm"

    # IP Address and Gateway
    ipconfig0 = "ip=${var.vm_ip_home[count.index]}/24,gw=172.16.150.254"
    
    # Cloudinit User
    ciuser = var.cloudinit_user
    # cipassword = ""
    
    # SSH KEY
    sshkeys = <<EOF
      ${var.ssh_key}
      EOF
  
    # VM Lifecyle Settings
    lifecycle {
      ignore_changes = [
        name, network, disk, sshkeys, target_node
    ]
  }

}

resource "proxmox_vm_qemu" "monitor" {
    
    count = 1
    target_node = var.proxmox_host

    # VM General Settings
    vmid = var.vm_id_monitor[count.index]
    name =  var.vm_hostname_monitor[count.index]
    desc = "*Automatically created by Terraform.*<br>Monitor VM"
    # VM Advanced General Settings
    onboot = true 

    # VM OS Settings
    clone = var.template_name
    full_clone = true

    # VM System Settings
    agent = 1
    
    # VM Hardware Settings
    cores = 4
    sockets = 1
    cpu = "host"
    memory = 4096
    scsihw   = "virtio-scsi-pci"
    boot = "order=scsi0;ide3"
    bootdisk    = "scsi0"
    vga {
        type = "virtio"
        memory = 512
    }

    # VM Disk Settings
    disks {
        ide {
            ide0 {
                disk {
                    size = 2
                    storage = "local-lvm"
                }
            }
        }
        scsi {
            scsi0 {
                disk {
                    size = 5
                    storage = "local-lvm"
                }
            }
        }
    }

    # VM Network Settings
    network {
        model  = "virtio"
        bridge = "vmbr1"
        tag = 150
    }

    # VM Cloud-Init Settings
    os_type = "cloud-init"
    cloudinit_cdrom_storage = "local-lvm"

    # IP Address and Gateway
    ipconfig0 = "ip=${var.vm_ip_monitor[count.index]}/24,gw=172.16.150.254"
    
    # Cloudinit User
    ciuser = var.cloudinit_user
    # cipassword = ""
    
    # SSH KEY
    sshkeys = <<EOF
      ${var.ssh_key}
      EOF
  
    # VM Lifecyle Settings
    lifecycle {
      ignore_changes = [
        name, network, disk, sshkeys, target_node
    ]
  }
}


data "template_file" "hostfile" {
  template = file("host.tpl")
  vars = {
    home_vm_ip = "${join("\n", [for instance in proxmox_vm_qemu.home : join("", [instance.name, " ansible_host=", instance.default_ipv4_address])])}"
    monitor_vm_ip = "${join("\n", [for instance in proxmox_vm_qemu.monitor : join("", [instance.name, " ansible_host=", instance.default_ipv4_address])])}"
  }
}

resource "local_file" "hosts" {
  content  = data.template_file.hostfile.rendered
  filename = "../Ansible/inventory/hosts"
}

output "Home-IPs" {
  value = ["${proxmox_vm_qemu.home.*.default_ipv4_address}"]
}

output "Monitor-IPs" {
  value = ["${proxmox_vm_qemu.monitor.*.default_ipv4_address}"]
}
