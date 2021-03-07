variable "vsphere_user" {
description = "user for access vSphere vCenter appliance"
type = string
default = "XXX"
}
variable "vsphere_password" {
description = "password for access vSphere vCenter appliance"
type = string
default = "XXX"
}
variable "vsphere_server" {
description = "vSphere server ip address"
type = string
default = "X.X.X.X"
}
variable "vsphere_ssl" {
description = "Permit untrusted SSL certificate"
type = string
default = "true"
}
