variable "compartment_id" {
  description = "OCID of the compartment where streaming resources are created."
  type        = string
}

variable "stream_pool_name" {
  description = "Name of the streaming pool."
  type        = string
}

variable "stream_name" {
  description = "Name of the stream receiving logs."
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

variable "freeform_tags" {
  description = "Freeform tags to apply to streaming resources."
  type        = map(string)
  default     = {}
}

variable "defined_tags" {
  description = "Defined tags to apply to streaming resources."
  type        = map(string)
  default     = {}
}
