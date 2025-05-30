
output "nsx_managers" {
  value = var.nsx != null ? [for manager in var.nsx.managers : {
    ip       = manager.ip
    hostname = "${manager.hostname}.${var.domain_name}"
    password = var.nsx.password
    name     = manager.hostname
    source   = var.nsx.manager_ova
  }] : null
}


output "nsx_edges" {
  value = var.nsx != null ? [for edge in var.nsx.edge_vm_list : {
    ip       = edge.management_ip
    hostname = "${edge.hostname}.${var.domain_name}"
    password = var.nsx.password
    name     = edge.hostname
    source   = var.nsx.manager_ova
  }] : null
}

output "avi_controllers" {
  value = var.avi != null ? [for controller in var.avi.controllers : {
    ip       = controller.ip
    hostname = "${controller.hostname}.${var.domain_name}"
    password = var.avi.password
    name     = controller.hostname
    source   = var.avi.controller_ova_url
  }] : null
}
