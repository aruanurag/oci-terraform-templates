output "bucket_id" {
  description = "Bucket OCID."
  value       = module.objectstorage.bucket_id
}

output "function_id" {
  description = "Function OCID."
  value       = module.functions.function_id
}

output "events_rule_id" {
  description = "Events rule OCID."
  value       = module.events.rule_id
}

output "log_group_id" {
  description = "Log Group OCID."
  value       = module.logging.log_group_id
}

output "service_connector_id" {
  description = "Service Connector OCID."
  value       = module.service_connector.connector_id
}
