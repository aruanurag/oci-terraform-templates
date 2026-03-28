terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = ">= 5.0.0"
    }
  }
}

provider "oci" {}

resource "oci_apigateway_gateway" "api_gateway" {
  display_name    = var.api_gateway_display_name
  compartment_id  = var.compartment_id
  endpoint_type   = "PUBLIC"

  subnet_id = var.subnet_id
}

resource "oci_core_instance" "backend_instance" {
  availability_domain = var.availability_domain
  compartment_id      = var.compartment_id
  shape               = var.instance_shape

  metadata = {
    ssh_authorized_keys = var.ssh_authorized_keys
  }
}

resource "oci_nosql_table" "nosql_table" {
  name                 = var.nosql_table_name
  compartment_id       = var.compartment_id
  ddl_statement        = var.ddl_statement
}