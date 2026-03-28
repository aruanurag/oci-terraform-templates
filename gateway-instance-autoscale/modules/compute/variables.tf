variable "compartment_id" {
  type        = string
  description = "Compartment OCID."
}

variable "instance_pool_name" {
  type        = string
  description = "Instance pool name."
}

variable "instance_configuration_name" {
  type        = string
  description = "Instance configuration name."
}

variable "instance_subnet_ids" {
  type        = list(string)
  description = "Instance subnet IDs."
}

variable "availability_domains" {
  type        = list(string)
  description = "Availability domains."
}

variable "shape" {
  type        = string
  description = "Compute shape."
}

variable "ocpus" {
  type        = number
  description = "OCPUs for flex shapes."
  default     = 1
}

variable "memory_in_gbs" {
  type        = number
  description = "Memory in GB for flex shapes."
  default     = 8
}

variable "shape_config_enabled" {
  type        = bool
  description = "Enable shape_config (for flex shapes)."
  default     = true
}

variable "image_id" {
  type        = string
  description = "Image OCID."
}

variable "ssh_authorized_keys" {
  type        = string
  description = "SSH authorized keys."
}

variable "user_data_base64" {
  type        = string
  description = "Base64 user_data."
  default     = ""
}

variable "instance_nsg_ids" {
  type        = list(string)
  description = "Instance NSG IDs."
  default     = []
}

variable "initial_size" {
  type        = number
  description = "Initial instance pool size."
  default     = 1
}

variable "placement_configurations" {
  type = list(object({
    availability_domain = string
    primary_subnet_id   = string
    fault_domains       = optional(list(string))
  }))
  description = "Placement configurations for the instance pool."
}
