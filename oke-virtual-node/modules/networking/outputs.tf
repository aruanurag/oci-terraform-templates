output "vcn_id" {
  description = "Validated VCN OCID."
  value       = data.oci_core_vcn.this.id
}

output "endpoint_subnet_id" {
  description = "Validated endpoint subnet OCID."
  value       = data.oci_core_subnet.endpoint.id
}

output "service_lb_subnet_id" {
  description = "Validated service LB subnet OCID."
  value       = data.oci_core_subnet.service_lb.id
}

output "worker_subnet_ids" {
  description = "Validated worker subnet OCIDs."
  value       = [for s in data.oci_core_subnet.worker : s.id]
}

output "pod_subnet_ids" {
  description = "Validated pod subnet OCIDs."
  value       = [for s in data.oci_core_subnet.pod : s.id]
}

output "nsg_ids" {
  description = "NSG OCIDs."
  value       = var.nsg_ids
}
