output "vcn_id" {
  description = "VCN OCID."
  value       = var.vcn_id
}

output "function_subnet_ids" {
  description = "Function subnet IDs."
  value       = var.function_subnet_ids
}

output "function_nsg_ids" {
  description = "Function NSG IDs."
  value       = var.function_nsg_ids
}
