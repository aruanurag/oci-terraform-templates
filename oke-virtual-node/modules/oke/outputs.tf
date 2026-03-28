output "cluster_id" {
  description = "OKE cluster OCID."
  value       = oci_containerengine_cluster.this.id
}

output "virtual_node_pool_id" {
  description = "Virtual node pool OCID."
  value       = oci_containerengine_virtual_node_pool.this.id
}

output "endpoint_config" {
  description = "Endpoint config for the cluster."
  value       = oci_containerengine_cluster.this.endpoint_config
}
