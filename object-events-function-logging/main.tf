provider "oci" {}

locals {
  event_condition = var.event_condition != "" ? var.event_condition : jsonencode({
    eventType = ["com.oraclecloud.objectstorage.createobject"]
    data = {
      compartmentId = [var.compartment_id]
      resourceName  = [var.bucket_name]
    }
  })
}

module "networking" {
  source = "./modules/networking"

  compartment_id      = var.compartment_id
  vcn_id              = var.vcn_id
  function_subnet_ids = var.function_subnet_ids
  function_nsg_ids    = var.function_nsg_ids
}

module "objectstorage" {
  source = "./modules/objectstorage"

  compartment_id        = var.compartment_id
  namespace             = var.objectstorage_namespace
  bucket_name           = var.bucket_name
  storage_tier          = var.bucket_storage_tier
  object_events_enabled = var.object_events_enabled
}

module "functions" {
  source = "./modules/functions"

  compartment_id           = var.compartment_id
  application_name         = var.application_name
  application_subnet_ids   = module.networking.function_subnet_ids
  application_nsg_ids      = module.networking.function_nsg_ids
  application_shape        = var.application_shape

  function_name              = var.function_name
  function_image             = var.function_image
  function_memory_in_mbs     = var.function_memory_in_mbs
  function_timeout_in_seconds = var.function_timeout_in_seconds
}

module "events" {
  source = "./modules/events"

  compartment_id   = var.compartment_id
  rule_name        = var.event_rule_name
  rule_description = var.event_rule_description
  condition        = local.event_condition
  function_id      = module.functions.function_id
}

module "logging" {
  source = "./modules/logging"

  compartment_id       = var.compartment_id
  log_group_name       = var.log_group_name
  log_name             = var.log_name
  function_resource_id = module.functions.function_id
}

module "service_connector" {
  source = "./modules/service-connector"

  compartment_id       = var.compartment_id
  connector_name       = var.service_connector_name
  source_log_group_id  = module.logging.log_group_id
  source_log_id        = module.logging.log_id

  target_kind          = var.service_connector_target_kind
  target_log_group_id  = module.logging.log_group_id
}
