variable "compartment_id" {
  type        = string
  description = "Compartment OCID."
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
