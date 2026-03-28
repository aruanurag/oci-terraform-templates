output "nlb_id" {
  description = "NLB OCID."
  value       = oci_network_load_balancer_network_load_balancer.this.id
}
