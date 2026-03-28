# OCI API Gateway with Instance Backend and NoSQL Table

This Terraform module deploys an API Gateway, a Compute Instance backend, and a NoSQL Table in Oracle Cloud Infrastructure (OCI).

## Prerequisites

1. An Oracle Cloud Infrastructure tenancy.
2. The following IAM policies are required:
   - Permissions to create API Gateways.
   - Permissions to create Compute Instances.
   - Permissions to create NoSQL Tables.

## Usage

```hcl
module "api_gateway_instance_nosql" {
  source = "./api-gateway-instance-nosql-template"

  compartment_id           = "<your_compartment_ocid>"
  api_gateway_display_name = "example-api-gateway"
  default_certificate_id   = "<your_certificate_ocid>"
  availability_domain      = "<your_availability_domain>"
  instance_shape           = "VM.Standard.E4.Flex"
  ssh_authorized_keys      = "<your_ssh_public_key>"
  nosql_table_name         = "example-table"
  ddl_statement            = "CREATE TABLE example (id STRING, value STRING, PRIMARY KEY (id))"
}
```

## Input Variables

| Name                    | Description                                    | Type   | Default                |
|-------------------------|------------------------------------------------|--------|------------------------|
| `compartment_id`        | The OCID of the Compartment.                  | string |                        |
| `api_gateway_display_name` | Display name of the API Gateway.             | string |                        |
| `default_certificate_id` | The OCID of the default certificate.          | string |                        |
| `availability_domain`   | Availability Domain for the instance.         | string |                        |
| `instance_shape`        | Shape of the Compute Instance.                | string | `VM.Standard.E4.Flex` |
| `ssh_authorized_keys`   | SSH public keys for instance access.          | string |                        |
| `nosql_table_name`      | Name of the NoSQL table.                      | string |                        |
| `ddl_statement`         | DDL statement to define NoSQL Table schema.   | string |                        |

## Outputs

| Name                    | Description                               |
|-------------------------|-------------------------------------------|
| `api_gateway_id`        | The OCID of the API Gateway.             |
| `api_gateway_public_endpoint` | Public endpoint of the API Gateway.  |
| `backend_instance_id`   | OCID of the backend Compute Instance.    |
| `nosql_table_id`        | OCID of the NoSQL Table.                 |