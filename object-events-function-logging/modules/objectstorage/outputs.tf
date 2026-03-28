output "bucket_id" {
  description = "Bucket OCID."
  value       = oci_objectstorage_bucket.this.id
}
