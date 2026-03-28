output "log_group_id" {
  description = "Log group OCID."
  value       = oci_logging_log_group.this.id
}

output "log_id" {
  description = "Log OCID."
  value       = oci_logging_log.this.id
}
