variable "compartment_id" {
  type        = string
  description = "Compartment OCID."
}

variable "rule_name" {
  type        = string
  description = "Rule name."
}

variable "rule_description" {
  type        = string
  description = "Rule description."
}

variable "condition" {
  type        = string
  description = "Event condition JSON string."
}

variable "function_id" {
  type        = string
  description = "Function OCID to invoke."
}
