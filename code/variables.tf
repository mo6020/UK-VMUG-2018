// these vars hidden because they might be sensitive?
variable "vc_user" {}
variable "vc_password" {}
variable "vc_server" {}
variable "vc_domain" {}
variable "vc_cluster" {}
variable "vc_datacentre" {}

// default VM Template
variable "vm_template" {
  default = "centos7-min-x86_64-patched-noroot-puppet"
}
// default VM folder
variable "vm_folder" {
  default = "Experimental VMs"
}
// default VM network
variable "vm_network" {
  default = "UserVMs-Linux - v1048"
}
// default datastore
variable "vm_datastore" {
  default = "emea2-personal-dsc"
}

variable "ssh_key_public" {
  default     = "~/.ssh/id_rsa.pub"
  description = "Path to the SSH public key for accessing VMs."
}

variable "ssh_key_private" {
  default     = "~/.ssh/id_rsa"
  description = "Path to the SSH public key for accessing VMs."
}