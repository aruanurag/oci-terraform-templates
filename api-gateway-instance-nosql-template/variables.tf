variable "compartment_id" {
  description = "The OCID of the Compartment where resources will be created."
  type        = string
}

variable "api_gateway_display_name" {
  description = "Display name of the API Gateway."
  type        = string
}

variable "subnet_id" {
  description = "The OCID of the subnet where the API Gateway will be deployed."
  type        = string
}

variable "availability_domain" {
  description = "The Availability Domain where the instance will be created."
  type        = string
}

variable "instance_shape" {
  description = "Shape of the backend instance."
  type        = string
  default     = "VM.Standard.E4.Flex"
}

variable "ssh_authorized_keys" {
  description = "SSH public keys for access to the instance."
  type        = string
}

variable "nosql_table_name" {
  description = "Name of the NoSQL table."
  type        = string
}

variable "ddl_statement" {
  description = "The DDL statement used to declare the table schema."
  type        = string
}