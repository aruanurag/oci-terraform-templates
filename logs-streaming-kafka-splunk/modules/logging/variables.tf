variable "compartment_id" {
  description = "OCID of the compartment where logging resources are created."
  type        = string
}

variable "log_group_display_name" {
  description = "Display name for the log group."
  type        = string
}

variable "log_group_description" {
  description = "Description for the log group."
  type        = string
  default     = "Log group for streaming log pipeline"
}

variable "log_display_name" {
  description = "Display name for the log."
  type        = string
}

variable "log_type" {
  description = "Log type (SERVICE or CUSTOM)."
  type        = string
  default     = "SERVICE"
}

variable "log_is_enabled" {
  description = "Whether the log is enabled."
  type        = bool
  default     = true
}

variable "log_retention_duration" {
  description = "Retention duration for logs in days (30, 60, 90, 120, 150, 180)."
  type        = number
  default     = 30
}

variable "log_source_category" {
  description = "Log source category for the logging service."
  type        = string
}

variable "log_source_resource" {
  description = "OCID of the resource emitting logs."
  type        = string
}

variable "log_source_service" {
  description = "Service generating logs (e.g., objectstorage)."
  type        = string
}

variable "log_source_type" {
  description = "Log source type (OCISERVICE)."
  type        = string
  default     = "OCISERVICE"
}

variable "log_source_parameters" {
  description = "Optional log source parameters for OCI service logs."
  type        = map(string)
  default     = {}
}

variable "freeform_tags" {
  description = "Freeform tags to apply to logging resources."
  type        = map(string)
  default     = {}
}

variable "defined_tags" {
  description = "Defined tags to apply to logging resources."
  type        = map(string)
  default     = {}
}
