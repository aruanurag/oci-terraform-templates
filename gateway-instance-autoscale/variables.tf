variable "compartment_id" {
  type        = string
  description = "Compartment OCID."
}

variable "vcn_id" {
  type        = string
  description = "Existing VCN OCID."
}

variable "nlb_subnet_id" {
  type        = string
  description = "Subnet OCID for the Network Load Balancer."
}

variable "instance_subnet_ids" {
  type        = list(string)
  description = "Subnets for the instance pool."
}

variable "nlb_nsg_ids" {
  type        = list(string)
  description = "NSG OCIDs for the NLB."
  default     = []
}

variable "instance_nsg_ids" {
  type        = list(string)
  description = "NSG OCIDs for instances."
  default     = []
}

variable "availability_domains" {
  type        = list(string)
  description = "Availability domains for the instance pool placement."
}

variable "instance_pool_name" {
  type        = string
  description = "Instance pool name."
  default     = "gateway-instance-pool"
}

variable "instance_configuration_name" {
  type        = string
  description = "Instance configuration name."
  default     = "gateway-instance-config"
}

variable "instance_pool_initial_size" {
  type        = number
  description = "Initial size of the instance pool."
  default     = 1
}

variable "instance_shape" {
  type        = string
  description = "Compute shape (e.g., VM.Standard.E4.Flex)."
}

variable "instance_ocpus" {
  type        = number
  description = "OCPUs for flex shapes."
  default     = 1
}

variable "instance_memory_in_gbs" {
  type        = number
  description = "Memory (GB) for flex shapes."
  default     = 8
}

variable "instance_image_id" {
  type        = string
  description = "Image OCID for instances."
}

variable "ssh_authorized_keys" {
  type        = string
  description = "SSH public keys."
}

variable "user_data_base64" {
  type        = string
  description = "Optional user_data (base64 encoded)."
  default     = ""
}

variable "autoscaling_min_size" {
  type        = number
  description = "Autoscaling min size."
  default     = 1
}

variable "autoscaling_max_size" {
  type        = number
  description = "Autoscaling max size."
  default     = 3
}

variable "autoscaling_target_cpu" {
  type        = number
  description = "Target CPU utilization percentage."
  default     = 70
}

variable "autoscaling_scale_out_step" {
  type        = number
  description = "Scale out by N instances."
  default     = 1
}

variable "autoscaling_scale_in_step" {
  type        = number
  description = "Scale in by N instances."
  default     = 1
}

variable "nlb_name" {
  type        = string
  description = "Network Load Balancer name."
  default     = "gateway-nlb"
}

variable "listener_port" {
  type        = number
  description = "Listener port for NLB."
  default     = 80
}

variable "backend_port" {
  type        = number
  description = "Backend port for instances."
  default     = 8080
}

variable "backend_ips" {
  type        = list(string)
  description = "Backend IP addresses for NLB (leave empty to manage externally)."
  default     = []
}

variable "policy_name" {
  type        = string
  description = "IAM policy name."
  default     = "gateway-instance-autoscale-policy"
}

variable "policy_description" {
  type        = string
  description = "IAM policy description."
  default     = "IAM policies required for NLB + instance pool + autoscaling."
}

variable "policy_statements" {
  type        = list(string)
  description = "IAM policy statements."
  default = [
    "Allow service autoscaling to manage instance-pools in compartment id <compartment_ocid>",
    "Allow service autoscaling to read metrics in compartment id <compartment_ocid>",
    "Allow service compute to manage instance-family in compartment id <compartment_ocid>",
    "Allow service compute to use subnets in compartment id <compartment_ocid>",
    "Allow service compute to use network-security-groups in compartment id <compartment_ocid>",
    "Allow service network-load-balancer to use subnets in compartment id <compartment_ocid>",
    "Allow service network-load-balancer to use network-security-groups in compartment id <compartment_ocid>"
  ]
}

variable "placement_configurations" {
  type = list(object({
    availability_domain = string
    primary_subnet_id   = string
    fault_domains       = optional(list(string))
  }))
  description = "Placement configurations for the instance pool."
}
