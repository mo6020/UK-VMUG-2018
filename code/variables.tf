// these vars hidden because they might be sensitive?
variable "vc_user" {}
variable "vc_password" {}
variable "vc_server" {}
variable "vc_domain" {}
variable "vc_cluster" {}
variable "vc_datacentre" {}

// default VM Template
variable "vm_template" {
  default = "centos7-template"
}
// default VM folder
variable "vm_folder" {
  default = "Testing/SE-EMORGAN-Terraform"
}
// default VM network
variable "vm_network" {
  default = "VLAN56_Servers_Test"
}
// default datastore
variable "vm_datastore" {
  default = "pure-emea"
}

variable "ssh_key_public" {
  default     = "~/.ssh/id_rsa.pub"
  description = "Path to the SSH public key for accessing VMs."
}

variable "ssh_key_private" {
  default     = "~/.ssh/id_rsa"
  description = "Path to the SSH public key for accessing VMs."
}