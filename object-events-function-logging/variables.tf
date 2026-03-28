variable "compartment_id" {
  type        = string
  description = "Compartment OCID."
}

variable "vcn_id" {
  type        = string
  description = "Existing VCN OCID."
}

variable "function_subnet_ids" {
  type        = list(string)
  description = "Subnets for the Functions application."
}

variable "function_nsg_ids" {
  type        = list(string)
  description = "NSG IDs for the Functions application."
  default     = []
}

variable "objectstorage_namespace" {
  type        = string
  description = "Object Storage namespace."
}

variable "bucket_name" {
  type        = string
  description = "Bucket name for object uploads."
}

variable "bucket_storage_tier" {
  type        = string
  description = "Storage tier for the bucket."
  default     = "Standard"
}

variable "object_events_enabled" {
  type        = bool
  description = "Enable Object Storage events."
  default     = true
}

variable "application_name" {
  type        = string
  description = "Functions application name."
  default     = "object-events-app"
}

variable "application_shape" {
  type        = string
  description = "Functions application shape."
  default     = "GENERIC_X86"
}

variable "function_name" {
  type        = string
  description = "Function name."
  default     = "image-processor"
}

variable "function_image" {
  type        = string
  description = "OCIR image for the function."
}

variable "function_memory_in_mbs" {
  type        = number
  description = "Function memory in MB."
  default     = 256
}

variable "function_timeout_in_seconds" {
  type        = number
  description = "Function timeout in seconds."
  default     = 30
}

variable "event_rule_name" {
  type        = string
  description = "Events rule name."
  default     = "object-create-events"
}

variable "event_rule_description" {
  type        = string
  description = "Events rule description."
  default     = "Trigger Functions when objects are created."
}

variable "event_condition" {
  type        = string
  description = "Events rule condition (JSON). Leave empty to auto-generate."
  default     = ""
}

variable "log_group_name" {
  type        = string
  description = "Log group name."
  default     = "function-logs"
}

variable "log_name" {
  type        = string
  description = "Log name."
  default     = "function-log"
}

variable "service_connector_name" {
  type        = string
  description = "Service Connector name."
  default     = "function-log-connector"
}

variable "service_connector_target_kind" {
  type        = string
  description = "Service Connector target kind (e.g., logging)."
  default     = "logging"
}
