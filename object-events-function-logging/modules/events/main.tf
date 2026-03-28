resource "oci_events_rule" "this" {
  compartment_id = var.compartment_id
  display_name   = var.rule_name
  description    = var.rule_description
  condition      = var.condition
  is_enabled     = true

  actions {
    actions {
      action_type = "FAAS"
      function_id = var.function_id
      is_enabled  = true
    }
  }
}
