output "policy_id" {
  description = "IAM policy OCID."
  value       = oci_identity_policy.this.id
}
