output "bucket_name" {
  description = "Name of created Object Storage bucket"
  value       = oci_objectstorage_bucket.this.name
}

output "bucket_namespace" {
  description = "Namespace for the Object Storage bucket"
  value       = data.oci_objectstorage_namespace.ns.namespace
}

output "events_rule_id" {
  description = "OCI Events rule ID created for object create events"
  value       = oci_events_rule.on_object_created.id
}

output "events_action_id" {
  description = "OCI Events action ID invoking the function"
  value       = oci_events_rule_action.invoke_function.id
}
