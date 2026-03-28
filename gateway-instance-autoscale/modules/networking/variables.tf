variable "compartment_id" {
  type        = string
  description = "Compartment OCID."
}

variable "vcn_id" {
  type        = string
  description = "VCN OCID."
}

variable "nlb_subnet_id" {
  type        = string
  description = "NLB subnet OCID."
}

variable "instance_subnet_ids" {
  type        = list(string)
  description = "Instance subnet OCIDs."
}

variable "nlb_nsg_ids" {
  type        = list(string)
  description = "NLB NSG OCIDs."
  default     = []
}

variable "instance_nsg_ids" {
  type        = list(string)
  description = "Instance NSG OCIDs."
  default     = []
}
