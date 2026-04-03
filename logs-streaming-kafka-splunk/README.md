# Stream OCI logs to OCI Streaming (Kafka compatible) for Splunk

This template creates an OCI Logging log group and log, a Streaming pool and stream, and a Service Connector Hub connector to move logs into the stream for downstream Kafka Connect (Splunk) consumption.

## Module Structure

```
logs-streaming-kafka-splunk/
├── main.tf
├── variables.tf
├── outputs.tf
├── versions.tf
├── README.md
└── modules/
    ├── logging/
    │   ├── main.tf
    │   ├── variables.tf
    │   ├── outputs.tf
    │   └── versions.tf
    ├── streaming/
    │   ├── main.tf
    │   ├── variables.tf
    │   ├── outputs.tf
    │   └── versions.tf
    └── service-connector/
        ├── main.tf
        ├── variables.tf
        ├── outputs.tf
        └── versions.tf
```

## Prerequisites

- OCI tenancy with permissions to manage Logging, Streaming, and Service Connector Hub.
- IAM policies (example):
  - Allow group <group> to manage log-groups in compartment <compartment>
  - Allow group <group> to manage logs in compartment <compartment>
  - Allow group <group> to manage stream-pools in compartment <compartment>
  - Allow group <group> to manage streams in compartment <compartment>
  - Allow group <group> to manage service-connectors in compartment <compartment>

## Usage

```hcl
module "logs_streaming_kafka_splunk" {
  source = "./logs-streaming-kafka-splunk"

  compartment_id               = var.compartment_id
  log_group_display_name       = var.log_group_display_name
  log_group_description        = var.log_group_description
  log_display_name             = var.log_display_name
  log_type                     = var.log_type
  log_is_enabled               = var.log_is_enabled
  log_retention_duration       = var.log_retention_duration
  log_source_category          = var.log_source_category
  log_source_resource          = var.log_source_resource
  log_source_service           = var.log_source_service
  log_source_type              = var.log_source_type
  log_source_parameters        = var.log_source_parameters

  stream_pool_name             = var.stream_pool_name
  stream_name                  = var.stream_name
  stream_partitions            = var.stream_partitions
  stream_retention_hours       = var.stream_retention_hours
  kafka_auto_create_topics     = var.kafka_auto_create_topics
  kafka_log_retention_hours    = var.kafka_log_retention_hours
  kafka_default_partitions     = var.kafka_default_partitions

  service_connector_display_name = var.service_connector_display_name
  service_connector_description  = var.service_connector_description
  log_source_compartment_id      = var.log_source_compartment_id

  freeform_tags                = var.freeform_tags
  defined_tags                 = var.defined_tags
}
```

## Input Variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| compartment_id | OCID of the compartment where resources are created. | string | n/a | yes |
| log_group_display_name | Display name for the log group. | string | n/a | yes |
| log_group_description | Description for the log group. | string | "Log group for streaming log pipeline" | no |
| log_display_name | Display name for the log. | string | n/a | yes |
| log_type | Log type (SERVICE or CUSTOM). | string | "SERVICE" | no |
| log_is_enabled | Whether the log is enabled. | bool | true | no |
| log_retention_duration | Retention duration for logs in days (30, 60, 90, 120, 150, 180). | number | 30 | no |
| log_source_category | Log source category for the logging service. | string | n/a | yes |
| log_source_resource | OCID of the resource emitting logs. | string | n/a | yes |
| log_source_service | Service generating logs (e.g., objectstorage). | string | n/a | yes |
| log_source_type | Log source type (OCISERVICE). | string | "OCISERVICE" | no |
| log_source_parameters | Optional log source parameters for OCI service logs. | map(string) | {} | no |
| stream_pool_name | Name for the streaming pool. | string | n/a | yes |
| stream_name | Name for the stream. | string | n/a | yes |
| stream_partitions | Number of partitions for the stream. | number | 1 | no |
| stream_retention_hours | Retention period for the stream in hours. | number | 24 | no |
| kafka_auto_create_topics | Enable auto topic creation for Kafka compatibility. | bool | true | no |
| kafka_log_retention_hours | Default Kafka log retention in hours. | number | 24 | no |
| kafka_default_partitions | Default Kafka partitions for new topics. | number | 1 | no |
| service_connector_display_name | Display name for the service connector. | string | n/a | yes |
| service_connector_description | Description for the service connector. | string | "Logging to Streaming connector" | no |
| log_source_compartment_id | Compartment OCID containing the log sources. | string | n/a | yes |
| freeform_tags | Freeform tags to apply to resources. | map(string) | {} | no |
| defined_tags | Defined tags to apply to resources. | map(string) | {} | no |

## Outputs

| Name | Description |
|------|-------------|
| log_group_id | OCID of the log group. |
| log_id | OCID of the log. |
| stream_pool_id | OCID of the stream pool. |
| stream_id | OCID of the stream. |
| service_connector_id | OCID of the service connector. |

## Module Details

### logging
Creates the log group and log that act as the source for the Service Connector.

**Inputs:** compartment_id, log_group_display_name, log_group_description, log_display_name, log_type, log_is_enabled, log_retention_duration, log_source_category, log_source_resource, log_source_service, log_source_type, log_source_parameters, freeform_tags, defined_tags

**Outputs:** log_group_id, log_id

### streaming
Creates the stream pool and stream to receive logs for Kafka Connect to Splunk.

**Inputs:** compartment_id, stream_pool_name, stream_name, stream_partitions, stream_retention_hours, kafka_auto_create_topics, kafka_log_retention_hours, kafka_default_partitions, freeform_tags, defined_tags

**Outputs:** stream_pool_id, stream_id

### service-connector
Creates the Service Connector Hub connector to move logs to the stream.

**Inputs:** compartment_id, service_connector_display_name, service_connector_description, log_source_compartment_id, log_group_id, log_id, stream_id, freeform_tags, defined_tags

**Outputs:** service_connector_id
