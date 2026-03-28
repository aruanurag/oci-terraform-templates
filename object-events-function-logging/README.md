# object-events-function-logging

This template creates an Object Storage bucket, an Events rule to invoke a Function on object creation, and a Service Connector to route function logs into OCI Logging.

Module structure:
- networking: pass-through for existing network IDs
- objectstorage: bucket with object events enabled
- functions: functions application + function
- events: events rule invoking the function
- logging: log group + log
- service-connector: routes logs to Logging

Architecture tree:
object-events-function-logging/
- main.tf
- variables.tf
- outputs.tf
- versions.tf
- README.md
- modules/
  - networking/
    - main.tf
    - variables.tf
    - outputs.tf
  - objectstorage/
    - main.tf
    - variables.tf
    - outputs.tf
  - functions/
    - main.tf
    - variables.tf
    - outputs.tf
  - events/
    - main.tf
    - variables.tf
    - outputs.tf
  - logging/
    - main.tf
    - variables.tf
    - outputs.tf
  - service-connector/
    - main.tf
    - variables.tf
    - outputs.tf

Prerequisites:
- OCI tenancy with permissions for Object Storage, Events, Functions, Logging, and Service Connector Hub
- Existing VCN and subnets for Functions

Usage:
module "object_events_function_logging" {
  source = "./object-events-function-logging"

  compartment_id          = "ocid1.compartment.oc1..example"
  vcn_id                  = "ocid1.vcn.oc1..example"
  function_subnet_ids     = ["ocid1.subnet.oc1..example"]
  objectstorage_namespace = "my-namespace"
  bucket_name             = "my-bucket"
  function_image          = "phx.ocir.io/tenancy/image:tag"
}

Outputs:
- bucket_id
- function_id
- events_rule_id
- log_group_id
- service_connector_id
