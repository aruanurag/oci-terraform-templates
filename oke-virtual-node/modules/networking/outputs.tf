output "vcn_id" {
  description = "VCN OCID."
  value       = var.vcn_id
}

output "endpoint_subnet_id" {
  description = "Endpoint subnet OCID."
  value       = var.endpoint_subnet_id
}

output "service_lb_subnet_id" {
  description = "Service LB subnet OCID."
  value       = var.service_lb_subnet_id
}

output "worker_subnet_ids" {
  description = "Worker subnet OCIDs."
  value       = var.worker_subnet_ids
}

output "pod_subnet_ids" {
  description = "Pod subnet OCIDs."
  value       = var.pod_subnet_ids
}

output "nsg_ids" {
  description = "NSG OCIDs."
  value       = var.nsg_ids
}
