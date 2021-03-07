provider "vsphere" {
	user = var.vsphere_user
	password = var.vsphere_password
	vsphere_server = var.vsphere_server
	allow_unverified_ssl = var.vsphere_ssl
}
data "vsphere_datacenter" "dc" {
  name = "name_dc"
}
data "vsphere_datastore" "datastore" {
  name          = "name_datastore"
  datacenter_id = data.vsphere_datacenter.dc.id
}
data "vsphere_resource_pool" "pool" {
  name          = "name_pool"
  datacenter_id = data.vsphere_datacenter.dc.id
}
data "vsphere_network" "network" {
  name          = "VM Network"
  datacenter_id = data.vsphere_datacenter.dc.id
}
data "vsphere_network" "network2" {
  name          = "Red Usuarios"
  datacenter_id = data.vsphere_datacenter.dc.id
}
resource "vsphere_virtual_machine" "vm" {
  name             = "Pfsense"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id
  num_cpus = 1
  memory   = 1024
  guest_id = "otherFreeBSD64Guest"
  wait_for_guest_net_timeout = 0
  network_interface {
    network_id = data.vsphere_network.network.id
  }
  network_interface {
    network_id = data.vsphere_network.network2.id
  }
  disk {
    label = "disk0"
    size  = 10
  }
  cdrom {
    datastore_id = data.vsphere_datastore.datastore.id
    path         = "ISO/pfSense-CE-2.3.5-RELEASE-amd64.iso"
  }
}
