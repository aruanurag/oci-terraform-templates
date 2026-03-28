terraform {
  required_providers {
    oci = {
      source  = "hashicorp/oci"
      version = "~> 4.0"
    }
  }
}

provider "oci" {
  region = var.region
}

data "oci_objectstorage_namespace" "ns" {}

resource "oci_objectstorage_bucket" "this" {
  compartment_id = var.compartment_id
  namespace      = data.oci_objectstorage_namespace.ns.namespace
  name           = var.bucket_name
  storage_tier   = "Standard"
  versioning     = "Disabled"
  public_access_type = "NoPublicAccess"
}

resource "oci_events_rule" "on_object_created" {
  compartment_id = var.compartment_id
  display_name   = "object-created-to-function"
  is_enabled     = true

  condition = "eventType = 'com.oraclecloud.objectstorage.object.create' AND data.bucketName = '${oci_objectstorage_bucket.this.name}'"
}

resource "oci_events_rule_action" "invoke_function" {
  depends_on = [oci_events_rule.on_object_created]
  
  rule_id    = oci_events_rule.on_object_created.id
  action_type = "FAAS"
  is_enabled = true
  
  faas_action {
    function_id = var.function_id
  }
}
