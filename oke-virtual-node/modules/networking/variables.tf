variable "compartment_id" {
  type        = string
  description = "Compartment OCID (for validation context)."
}

variable "vcn_id" {
  type        = string
  description = "VCN OCID."
}

variable "endpoint_subnet_id" {
  type        = string
  description = "Subnet for Kubernetes API endpoint."
}

variable "service_lb_subnet_id" {
  type        = string
  description = "Subnet for service load balancers."
}

variable "worker_subnet_ids" {
  type        = list(string)
  description = "Worker subnet OCIDs."
}

variable "pod_subnet_ids" {
  type        = list(string)
  description = "Pod subnet OCIDs."
  default     = []
}

variable "nsg_ids" {
  type        = list(string)
  description = "NSG OCIDs."
  default     = []
}
