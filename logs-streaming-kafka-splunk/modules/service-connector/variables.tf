variable "compartment_id" {
  description = "OCID of the compartment where the service connector is created."
  type        = string
}

variable "service_connector_display_name" {
  description = "Display name for the service connector."
  type        = string
}

variable "service_connector_description" {
  description = "Description for the service connector."
  type        = string
  default     = "Logging to Streaming connector"
}

variable "log_source_compartment_id" {
  description = "Compartment OCID containing the log sources."
  type        = string
}

variable "log_group_id" {
  description = "OCID of the log group used as the source."
  type        = string
}

variable "log_id" {
  description = "OCID of the log used as the source."
  type        = string
}

variable "stream_id" {
  description = "OCID of the streaming stream used as the target."
  type        = string
}

variable "freeform_tags" {
  description = "Freeform tags to apply to the service connector."
  type        = map(string)
  default     = {}
}

variable "defined_tags" {
  description = "Defined tags to apply to the service connector."
  type        = map(string)
  default     = {}
}
