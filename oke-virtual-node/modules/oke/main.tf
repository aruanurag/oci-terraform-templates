resource "oci_containerengine_cluster" "this" {
  compartment_id     = var.compartment_id
  name               = var.cluster_name
  kubernetes_version = var.kubernetes_version
  vcn_id             = var.vcn_id

  endpoint_config {
    is_public_ip_enabled = var.endpoint_is_public
    subnet_id            = var.endpoint_subnet_id
  }

  options {
    kubernetes_network_config {
      pods_cidr     = null
      services_cidr = null
    }
    service_lb_subnet_ids = [var.service_lb_subnet_id]
  }
}

resource "oci_containerengine_virtual_node_pool" "this" {
  compartment_id     = var.compartment_id
  cluster_id         = oci_containerengine_cluster.this.id
  display_name = var.virtual_node_pool_name
  size    = var.virtual_node_size
  nsg_ids = var.nsg_ids

  dynamic "placement_configurations" {
    for_each = var.placement_configurations
    content {
      availability_domain = placement_configurations.value.availability_domain
      subnet_id           = placement_configurations.value.subnet_id
      fault_domain        = length(try(placement_configurations.value.fault_domains, [])) > 0 ? placement_configurations.value.fault_domains : null
    }
  }

  pod_configuration {
    shape     = var.pod_shape
    subnet_id = length(var.pod_subnet_ids) > 0 ? var.pod_subnet_ids[0] : var.worker_subnet_ids[0]
    nsg_ids   = var.nsg_ids
  }
}
