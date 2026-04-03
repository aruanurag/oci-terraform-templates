provider "oci" {}

module "logging" {
  source                 = "./modules/logging"
  compartment_id         = var.compartment_id
  log_group_display_name = var.log_group_display_name
  log_group_description  = var.log_group_description
  log_display_name       = var.log_display_name
  log_type               = var.log_type
  log_is_enabled         = var.log_is_enabled
  log_retention_duration = var.log_retention_duration
  log_source_category    = var.log_source_category
  log_source_resource    = var.log_source_resource
  log_source_service     = var.log_source_service
  log_source_type        = var.log_source_type
  log_source_parameters  = var.log_source_parameters
  freeform_tags          = var.freeform_tags
  defined_tags           = var.defined_tags
}

module "streaming" {
  source                   = "./modules/streaming"
  compartment_id           = var.compartment_id
  stream_pool_name          = var.stream_pool_name
  stream_name               = var.stream_name
  stream_partitions         = var.stream_partitions
  stream_retention_hours    = var.stream_retention_hours
  kafka_auto_create_topics  = var.kafka_auto_create_topics
  kafka_log_retention_hours = var.kafka_log_retention_hours
  kafka_default_partitions  = var.kafka_default_partitions
  freeform_tags             = var.freeform_tags
  defined_tags              = var.defined_tags
}

module "service_connector" {
  source                         = "./modules/service-connector"
  compartment_id                 = var.compartment_id
  service_connector_display_name = var.service_connector_display_name
  service_connector_description  = var.service_connector_description
  log_source_compartment_id      = var.log_source_compartment_id
  log_group_id                   = module.logging.log_group_id
  log_id                         = module.logging.log_id
  stream_id                      = module.streaming.stream_id
  freeform_tags                  = var.freeform_tags
  defined_tags                   = var.defined_tags
}
