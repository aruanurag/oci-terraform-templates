output "log_group_id" {
  description = "OCID of the log group."
  value       = oci_logging_log_group.this.id
}

output "log_id" {
  description = "OCID of the log."
  value       = oci_logging_log.this.id
}
