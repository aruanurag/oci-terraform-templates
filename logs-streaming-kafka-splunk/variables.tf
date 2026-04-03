variable "compartment_id" {
  description = "OCID of the compartment where resources are created."
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

variable "stream_pool_name" {
  description = "Name for the streaming pool."
  type        = string
}

variable "stream_name" {
  description = "Name for the stream."
  type        = string
}

variable "stream_partitions" {
  description = "Number of partitions for the stream."
  type        = number
  default     = 1
}

variable "stream_retention_hours" {
  description = "Retention period for the stream in hours."
  type        = number
  default     = 24
}

variable "kafka_auto_create_topics" {
  description = "Enable auto topic creation for Kafka compatibility."
  type        = bool
  default     = true
}

variable "kafka_log_retention_hours" {
  description = "Default Kafka log retention in hours."
  type        = number
  default     = 24
}

variable "kafka_default_partitions" {
  description = "Default Kafka partitions for new topics."
  type        = number
  default     = 1
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

variable "freeform_tags" {
  description = "Freeform tags to apply to resources."
  type        = map(string)
  default     = {}
}

variable "defined_tags" {
  description = "Defined tags to apply to resources."
  type        = map(string)
  default     = {}
}
