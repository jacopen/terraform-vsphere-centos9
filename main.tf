resource "vsphere_virtual_machine" "centos9" {
  count = var.centos9 ? 1 : 0
  name  = var.name

  datastore_id     = var.datastore_id
  resource_pool_id = var.resource_pool_id

  num_cpus          = var.num_cpus
  memory            = var.memory
  guest_id          = "centos8_64Guest"
  nested_hv_enabled = var.nested_hv_enabled
  folder            = var.folder
  firmware          = "efi"

  network_interface {
    network_id = var.network_id
  }

  disk {
    label = "disk0"
    size  = var.disk_size
  }
  cdrom {
    client_device = true
  }
  clone {
    template_uuid = var.template_uuid
    linked_clone  = "false"
  }
  extra_config = {
    "guestinfo.metadata" = base64encode(templatefile("${path.module}/templates/base/metadata.yaml", {
      ip_address  = var.ip_address,
      subnet_mask = var.subnet_mask,
      gateway     = var.gateway,
      nameservers = var.nameservers,
      hostname    = var.hostname
    }))
    "guestinfo.metadata.encoding" = "base64"
    "guestinfo.userdata"          = var.userdata == "" ? base64encode(file("${path.module}/templates/base/userdata.yaml")) : var.userdata
    "guestinfo.userdata.encoding" = "base64"
  }
  tags = var.tags
}

resource "vsphere_virtual_machine" "ubuntu" {
  count = var.ubuntu ? 1 : 0
  name  = var.name

  datastore_id     = var.datastore_id
  resource_pool_id = var.resource_pool_id

  num_cpus          = var.num_cpus
  memory            = var.memory
  guest_id          = "ubuntu64Guest"
  nested_hv_enabled = var.nested_hv_enabled
  folder            = var.folder

  network_interface {
    network_id = var.network_id
  }

  disk {
    label = "disk0"
    size  = var.disk_size
  }
  cdrom {
    client_device = true
  }
  clone {
    template_uuid = var.template_uuid
    linked_clone  = "false"
  }
  extra_config = {
    "guestinfo.metadata" = base64encode(templatefile("${path.module}/templates/base/metadata.yaml", {
      ip_address  = var.ip_address,
      subnet_mask = var.subnet_mask,
      gateway     = var.gateway,
      nameservers = var.nameservers,
      hostname    = var.hostname
    }))
    "guestinfo.metadata.encoding" = "base64"
    "guestinfo.userdata"          = var.userdata == "" ? base64encode(file("${path.module}/templates/base/userdata.yaml")) : var.userdata
    "guestinfo.userdata.encoding" = "base64"
  }
  tags = var.tags
}
