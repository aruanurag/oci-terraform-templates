# Stream pool for Kafka-compatible OCI Streaming
resource "oci_streaming_stream_pool" "this" {
  compartment_id = var.compartment_id
  name           = var.stream_pool_name

  kafka_settings {
    auto_create_topics_enable = var.kafka_auto_create_topics
    log_retention_hours       = var.kafka_log_retention_hours
    num_partitions            = var.kafka_default_partitions
  }

  freeform_tags = var.freeform_tags
  defined_tags  = var.defined_tags
}

# Stream that will receive logs from Service Connector Hub
resource "oci_streaming_stream" "this" {
  name               = var.stream_name
  partitions         = var.stream_partitions
  retention_in_hours = var.stream_retention_hours
  stream_pool_id     = oci_streaming_stream_pool.this.id

  freeform_tags = var.freeform_tags
  defined_tags  = var.defined_tags
}
