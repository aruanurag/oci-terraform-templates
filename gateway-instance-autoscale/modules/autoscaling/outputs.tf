output "autoscaling_configuration_id" {
  description = "Autoscaling configuration OCID."
  value       = oci_autoscaling_auto_scaling_configuration.this.id
}
