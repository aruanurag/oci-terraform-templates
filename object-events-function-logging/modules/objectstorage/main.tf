resource "oci_objectstorage_bucket" "this" {
  compartment_id        = var.compartment_id
  namespace             = var.namespace
  name                  = var.bucket_name
  storage_tier          = var.storage_tier
  object_events_enabled = var.object_events_enabled
}
