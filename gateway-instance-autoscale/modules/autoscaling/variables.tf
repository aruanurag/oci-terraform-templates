variable "compartment_id" {
  type        = string
  description = "Compartment OCID."
}

variable "instance_pool_id" {
  type        = string
  description = "Instance pool OCID."
}

variable "min_size" {
  type        = number
  description = "Minimum size."
}

variable "max_size" {
  type        = number
  description = "Maximum size."
}

variable "target_cpu" {
  type        = number
  description = "Target CPU utilization."
}

variable "scale_out_step" {
  type        = number
  description = "Scale out step."
}

variable "scale_in_step" {
  type        = number
  description = "Scale in step."
}
