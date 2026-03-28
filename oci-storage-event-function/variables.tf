variable "compartment_id" {
  description = "OCI compartment OCID where resources are created"
  type        = string
}

variable "function_id" {
  description = "OCI Function OCID to invoke on bucket event"
  type        = string
}

variable "bucket_name" {
  description = "OCI Object Storage bucket name"
  type        = string
  default     = "oci-storage-event-bucket"
}

variable "region" {
  description = "OCI region. Optional if set in provider config or environment."
  type        = string
  default     = null
}
