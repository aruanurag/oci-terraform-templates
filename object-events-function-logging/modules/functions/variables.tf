variable "compartment_id" {
  type        = string
  description = "Compartment OCID."
}

variable "application_name" {
  type        = string
  description = "Functions application name."
}

variable "application_subnet_ids" {
  type        = list(string)
  description = "Subnets for the Functions application."
}

variable "application_nsg_ids" {
  type        = list(string)
  description = "NSG IDs for the Functions application."
  default     = []
}

variable "application_shape" {
  type        = string
  description = "Functions application shape."
  default     = "GENERIC_X86"
}

variable "function_name" {
  type        = string
  description = "Function name."
}

variable "function_image" {
  type        = string
  description = "Function image (OCIR)."
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
