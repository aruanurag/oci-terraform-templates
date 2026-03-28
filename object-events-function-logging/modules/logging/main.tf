resource "oci_logging_log_group" "this" {
  compartment_id = var.compartment_id
  display_name   = var.log_group_name
}

resource "oci_logging_log" "this" {
  log_group_id   = oci_logging_log_group.this.id
  display_name   = var.log_name
  log_type       = "CUSTOM"

  configuration {
    compartment_id = var.compartment_id
    source {
      source_type = "OCISERVICE"
      service     = "functions"
      resource    = var.function_resource_id
      category    = "invoke"
    }
  }
}
