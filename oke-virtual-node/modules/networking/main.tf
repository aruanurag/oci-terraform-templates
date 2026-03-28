data "oci_core_vcn" "this" {
  vcn_id = var.vcn_id
}

data "oci_core_subnet" "endpoint" {
  subnet_id = var.endpoint_subnet_id
}

data "oci_core_subnet" "service_lb" {
  subnet_id = var.service_lb_subnet_id
}

data "oci_core_subnet" "worker" {
  for_each  = toset(var.worker_subnet_ids)
  subnet_id = each.value
}

data "oci_core_subnet" "pod" {
  for_each  = toset(var.pod_subnet_ids)
  subnet_id = each.value
}
