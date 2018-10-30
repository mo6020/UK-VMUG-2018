// Set up the vSphere provider
provider "vsphere" {
  vsphere_server = "${var.vc_server}"
  user = "${var.vc_user}"
  password = "${var.vc_password}"
// Allow self-signed SSL certs
  allow_unverified_ssl = true
}

// Build first VM
resource "vsphere_virtual_machine" "tf-test-nginx" {
  name = "tf-test-nginx"
  vcpu = 1
  memory = 1024
  domain = "${var.vc_domain}"
  datacenter = "${var.vc_datacentre}"
  cluster = "${var.vc_cluster}"
  folder = "${var.vm_folder}"
  time_zone = "Europe/London"

// Network settings
  network_interface {
    label = "${var.vm_network}"
// lab is dhcp by default
  }

  // disks
  disk {
    template = "${var.vm_template}"
    datastore = "${var.vm_datastore}"
    type = "thin"
  }
}
// build second VM
resource "vsphere_virtual_machine" "tf-test-mysql" {
  name = "tf-test-mysql"
  vcpu = 1
  memory = 1024
  domain = "${var.vc_domain}"
  datacenter = "${var.vc_datacentre}"
  cluster = "${var.vc_cluster}"
  folder = "${var.vm_folder}"
  time_zone = "Europe/London"

// Network settings
  network_interface {
    label = "${var.vm_network}"
// lab is dhcp by default
  }
  // disks
  disk {
    template = "${var.vm_template}"
    datastore = "${var.vm_datastore}"
    type = "thin"
  }
}
