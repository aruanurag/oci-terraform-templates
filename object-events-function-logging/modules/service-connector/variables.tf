variable "compartment_id" {
  type        = string
  description = "Compartment OCID."
}

variable "connector_name" {
  type        = string
  description = "Service Connector name."
}

variable "source_log_group_id" {
  type        = string
  description = "Source log group OCID."
}

variable "source_log_id" {
  type        = string
  description = "Source log OCID."
}

variable "target_kind" {
  type        = string
  description = "Target kind for service connector."
}

variable "target_log_group_id" {
  type        = string
  description = "Target log group OCID."
}
