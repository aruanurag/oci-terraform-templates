variable "compartment_id" {
  type        = string
  description = "Compartment OCID."
}

variable "nlb_name" {
  type        = string
  description = "NLB name."
}

variable "nlb_subnet_id" {
  type        = string
  description = "NLB subnet OCID."
}

variable "nlb_nsg_ids" {
  type        = list(string)
  description = "NLB NSG OCIDs."
  default     = []
}

variable "listener_port" {
  type        = number
  description = "Listener port."
}

variable "backend_port" {
  type        = number
  description = "Backend port."
}

variable "backend_ips" {
  type        = list(string)
  description = "Backend IPs for NLB."
  default     = []
}
