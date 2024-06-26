terraform {

    required_version = "1.7.5"

     
    required_providers {
      proxmox = {
        source = "telmate/proxmox"
        version = "3.0.1-rc1"
      }
    }
}

variable "proxmox_api_url" {
    type = string
  
}
variable "proxmox_api_token_id" {
    type = string
    sensitive = true
    
}
variable "proxmox_api_secret" {
    type = string
    sensitive = true

}

provider "proxmox" {
    pm_api_url = var.proxmox_api_url
    pm_api_token_id = var.proxmox_api_token_id
    pm_api_token_secret = var.proxmox_api_secret
    pm_debug = true
    pm_tls_insecure = false
    pm_log_enable = true
    pm_log_file   = "terraform-plugin-proxmox.log"
    pm_log_levels = {
        _default    = "debug"
        _capturelog = ""
  }
}