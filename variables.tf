variable "name" {
  default = "CentOS"
}

variable "datastore_id" {

}

variable "datastore_cluster_id" {

}

variable "resource_pool_id" {

}

variable "num_cpus" {
  default = 2
}

variable "memory" {
  default = 4096
}

variable "nested_hv_enabled" {
  default = true
}

variable "folder" {
  default = "Sandbox"
}

variable "network_id" {}

variable "disk_size" {
  default = 20
}

variable "template_uuid" {

}

variable "ip_address" {
  default = ""
}

variable "subnet_mask" {
  default = ""
}

variable "gateway" {
  default = ""
}

variable "nameservers" {
  default = ""
}

variable "hostname" {
  default = ""
}

variable "userdata" {
  default = ""
}

variable "metadata" {
  default = ""
}

variable "ubuntu" {
  default = false
}

variable "centos9" {
  default = false
}

variable "rhel9" {
  default = false
}

variable "tags" {
  type    = list(string)
  default = []
}

variable "thin_provisioned" {
  type    = bool
  default = true
}