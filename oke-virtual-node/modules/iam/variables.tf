variable "compartment_id" {
  type        = string
  description = "Compartment OCID where the policy will be created."
}

variable "policy_name" {
  type        = string
  description = "Policy name."
}

variable "policy_description" {
  type        = string
  description = "Policy description."
}

variable "policy_statements" {
  type        = list(string)
  description = "IAM policy statements."
}
