output "stream_pool_id" {
  description = "OCID of the stream pool."
  value       = oci_streaming_stream_pool.this.id
}

output "stream_id" {
  description = "OCID of the stream."
  value       = oci_streaming_stream.this.id
}
