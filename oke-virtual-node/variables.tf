variable "compartment_id" {
  type        = string
  description = "Compartment OCID where the OKE cluster will be created."
}

variable "vcn_id" {
  type        = string
  description = "OCID of an existing VCN."
}

variable "endpoint_subnet_id" {
  type        = string
  description = "OCID of the subnet for the Kubernetes API endpoint."
}

variable "service_lb_subnet_id" {
  type        = string
  description = "OCID of the subnet used for service load balancers."
}

variable "worker_subnet_ids" {
  type        = list(string)
  description = "List of subnet OCIDs for virtual nodes."
}

variable "pod_subnet_ids" {
  type        = list(string)
  description = "List of pod subnet OCIDs (VCN-native)."
  default     = []
}

variable "nsg_ids" {
  type        = list(string)
  description = "List of NSG OCIDs to associate with the virtual node pool."
  default     = []
}

variable "cluster_name" {
  type        = string
  description = "Name of the OKE cluster."
}

variable "kubernetes_version" {
  type        = string
  description = "Kubernetes version for the OKE cluster."
}

variable "endpoint_is_public" {
  type        = bool
  description = "Whether the Kubernetes API endpoint is public."
  default     = false
}

variable "virtual_node_pool_name" {
  type        = string
  description = "Name of the virtual node pool."
  default     = "oke-virtual-node-pool"
}

variable "virtual_node_size" {
  type        = number
  description = "Virtual node pool size (number of virtual nodes)."
  default     = 1
}

variable "pod_shape" {
  type        = string
  description = "Compute shape for virtual nodes (e.g., CI.Standard.E4.Flex)."
}

variable "placement_configurations" {
  type = list(object({
    availability_domain = string
    subnet_id           = string
    fault_domains       = optional(list(string))
  }))
  description = "Placement configuration for virtual nodes (AD + subnet)."
}

variable "policy_name" {
  type        = string
  description = "Name of the IAM policy."
  default     = "oke-virtual-node-policy"
}

variable "policy_description" {
  type        = string
  description = "Description for the IAM policy."
  default     = "IAM policies required for OKE virtual nodes."
}

variable "policy_statements" {
  type        = list(string)
  description = "IAM policy statements required for the OKE virtual node setup."
  default = [
    "Allow service OKE to manage cluster-family in compartment id <compartment_ocid>",
    "Allow service OKE to manage virtual-network-family in compartment id <compartment_ocid>",
    "Allow service OKE to use subnets in compartment id <compartment_ocid>",
    "Allow service OKE to use network-security-groups in compartment id <compartment_ocid>",
    "Allow service OKE to use instance-family in compartment id <compartment_ocid>"
  ]
}
