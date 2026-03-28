output "nlb_id" {
  description = "Network Load Balancer OCID."
  value       = module.nlb.nlb_id
}

output "instance_pool_id" {
  description = "Instance Pool OCID."
  value       = module.compute.instance_pool_id
}

output "autoscaling_configuration_id" {
  description = "Autoscaling configuration OCID."
  value       = module.autoscaling.autoscaling_configuration_id
}

output "iam_policy_id" {
  description = "IAM policy OCID."
  value       = module.iam.policy_id
}
