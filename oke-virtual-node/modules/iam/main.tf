resource "oci_identity_policy" "this" {
  compartment_id = var.compartment_id
  name           = var.policy_name
  description    = var.policy_description
  statements     = var.policy_statements
}
