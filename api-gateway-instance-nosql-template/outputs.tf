output "api_gateway_id" {
  description = "The OCID of the API Gateway."
  value       = oci_apigateway_gateway.api_gateway.id
}

output "api_gateway_public_endpoint" {
  description = "Public endpoint of the API Gateway."
  value       = oci_apigateway_gateway.api_gateway.hostname
}

output "backend_instance_id" {
  description = "The OCID of the backend compute instance."
  value       = oci_core_instance.backend_instance.id
}

output "nosql_table_id" {
  description = "The OCID of the NoSQL Table."
  value       = oci_nosql_table.nosql_table.id
}