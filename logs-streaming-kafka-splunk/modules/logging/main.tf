# Log group and log definition for OCI Logging service
resource "oci_logging_log_group" "this" {
  compartment_id = var.compartment_id
  display_name   = var.log_group_display_name
  description    = var.log_group_description

  freeform_tags = var.freeform_tags
  defined_tags  = var.defined_tags
}

# Log definition that will be used as the Service Connector source
resource "oci_logging_log" "this" {
  display_name = var.log_display_name
  log_group_id = oci_logging_log_group.this.id
  log_type     = var.log_type
  is_enabled   = var.log_is_enabled

  retention_duration = var.log_retention_duration

  configuration {
    source {
      category    = var.log_source_category
      resource    = var.log_source_resource
      service     = var.log_source_service
      source_type = var.log_source_type
      parameters  = var.log_source_parameters
    }

    compartment_id = var.compartment_id
  }

  freeform_tags = var.freeform_tags
  defined_tags  = var.defined_tags
}
