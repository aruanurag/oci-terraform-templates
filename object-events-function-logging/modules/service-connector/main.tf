resource "oci_sch_service_connector" "this" {
  compartment_id = var.compartment_id
  display_name   = var.connector_name

  source {
    kind = "logging"
    log_sources {
      compartment_id = var.compartment_id
      log_group_id   = var.source_log_group_id
      log_id         = var.source_log_id
    }
  }

  target {
    kind           = var.target_kind
    compartment_id = var.compartment_id
    log_group_id   = var.target_log_group_id
  }
}
