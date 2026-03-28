output "cluster_id" {
  description = "OCID of the OKE cluster."
  value       = module.oke.cluster_id
}

output "virtual_node_pool_id" {
  description = "OCID of the virtual node pool."
  value       = module.oke.virtual_node_pool_id
}

output "endpoint_config" {
  description = "Kubernetes API endpoint configuration."
  value       = module.oke.endpoint_config
}

output "policy_id" {
  description = "OCID of the IAM policy."
  value       = module.iam.policy_id
}
