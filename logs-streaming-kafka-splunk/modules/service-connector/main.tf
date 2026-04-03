# Service Connector Hub connector from Logging to Streaming
resource "oci_sch_service_connector" "this" {
  compartment_id = var.compartment_id
  display_name   = var.service_connector_display_name
  description    = var.service_connector_description

  source {
    kind = "logging"

    log_sources {
      compartment_id = var.log_source_compartment_id
      log_group_id   = var.log_group_id
      log_id         = var.log_id
    }
  }

  target {
    kind      = "streaming"
    stream_id = var.stream_id
  }

  freeform_tags = var.freeform_tags
  defined_tags  = var.defined_tags
}
