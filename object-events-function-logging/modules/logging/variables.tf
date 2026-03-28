variable "compartment_id" {
  type        = string
  description = "Compartment OCID."
}

variable "log_group_name" {
  type        = string
  description = "Log group name."
}

variable "log_name" {
  type        = string
  description = "Log name."
}

variable "function_resource_id" {
  type        = string
  description = "Function OCID for log source."
}
