output "log_group_id" {
  description = "OCID of the log group."
  value       = module.logging.log_group_id
}

output "log_id" {
  description = "OCID of the log."
  value       = module.logging.log_id
}

output "stream_pool_id" {
  description = "OCID of the stream pool."
  value       = module.streaming.stream_pool_id
}

output "stream_id" {
  description = "OCID of the stream."
  value       = module.streaming.stream_id
}

output "service_connector_id" {
  description = "OCID of the service connector."
  value       = module.service_connector.service_connector_id
}
