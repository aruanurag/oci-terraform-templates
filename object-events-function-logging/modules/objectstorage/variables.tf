variable "compartment_id" {
  type        = string
  description = "Compartment OCID."
}

variable "namespace" {
  type        = string
  description = "Object Storage namespace."
}

variable "bucket_name" {
  type        = string
  description = "Bucket name."
}

variable "storage_tier" {
  type        = string
  description = "Storage tier."
  default     = "Standard"
}

variable "object_events_enabled" {
  type        = bool
  description = "Enable object events."
  default     = true
}
