resource "oci_functions_application" "this" {
  compartment_id             = var.compartment_id
  display_name               = var.application_name
  subnet_ids                 = var.application_subnet_ids
  network_security_group_ids = var.application_nsg_ids
  shape                      = var.application_shape
}

resource "oci_functions_function" "this" {
  application_id         = oci_functions_application.this.id
  display_name           = var.function_name
  image                  = var.function_image
  memory_in_mbs          = var.function_memory_in_mbs
  timeout_in_seconds     = var.function_timeout_in_seconds
}
