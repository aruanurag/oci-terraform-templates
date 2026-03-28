output "vcn_id" {
  description = "VCN OCID."
  value       = var.vcn_id
}

output "nlb_subnet_id" {
  description = "NLB subnet OCID."
  value       = var.nlb_subnet_id
}

output "instance_subnet_ids" {
  description = "Instance subnet OCIDs."
  value       = var.instance_subnet_ids
}

output "nlb_nsg_ids" {
  description = "NLB NSG OCIDs."
  value       = var.nlb_nsg_ids
}

output "instance_nsg_ids" {
  description = "Instance NSG OCIDs."
  value       = var.instance_nsg_ids
}
