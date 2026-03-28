variable "compartment_id" {
  type        = string
  description = "Compartment OCID."
}

variable "vcn_id" {
  type        = string
  description = "VCN OCID."
}

variable "function_subnet_ids" {
  type        = list(string)
  description = "Subnet IDs for Functions."
}

variable "function_nsg_ids" {
  type        = list(string)
  description = "NSG IDs for Functions."
  default     = []
}
