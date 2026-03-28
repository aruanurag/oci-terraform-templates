variable "compartment_id" {
  type        = string
  description = "Compartment OCID."
}

variable "cluster_name" {
  type        = string
  description = "OKE cluster name."
}

variable "kubernetes_version" {
  type        = string
  description = "Kubernetes version."
}

variable "vcn_id" {
  type        = string
  description = "VCN OCID."
}

variable "endpoint_subnet_id" {
  type        = string
  description = "Endpoint subnet OCID."
}

variable "service_lb_subnet_id" {
  type        = string
  description = "Service LB subnet OCID."
}

variable "pod_subnet_ids" {
  type        = list(string)
  description = "Pod subnet OCIDs."
  default     = []
}

variable "worker_subnet_ids" {
  type        = list(string)
  description = "Worker subnet OCIDs."
}

variable "nsg_ids" {
  type        = list(string)
  description = "NSG OCIDs."
  default     = []
}

variable "endpoint_is_public" {
  type        = bool
  description = "Whether the endpoint is public."
  default     = false
}

variable "virtual_node_pool_name" {
  type        = string
  description = "Virtual node pool name."
}

variable "virtual_node_size" {
  type        = string
  description = "Virtual node pool size (SMALL, MEDIUM, LARGE)."
}

variable "pod_shape" {
  type        = string
  description = "Compute shape for virtual nodes (e.g., CI.Standard.E4.Flex)."
}

variable "placement_configurations" {
  type = list(object({
    availability_domain = string
    subnet_id           = string
    fault_domain        = optional(string)
  }))
  description = "Placement configuration for virtual nodes (AD + subnet)."
}
