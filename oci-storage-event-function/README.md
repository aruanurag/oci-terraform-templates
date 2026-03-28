# OCI Storage + Events -> Function template

Provision an OCI Object Storage bucket and an OCI Events rule that triggers an OCI Function on object create events.

## Resources created

- `oci_objectstorage_bucket.bucket`
- `oci_events_rule.on_object_created`
- `oci_events_action.invoke_function`

## Requirements

- OCI tenancy and user with required IAM permissions:
  - `objectstorage.buckets.create` and access for the bucket
  - `events.rules.create`
  - `events.actions.create`
  - function invocation permission from Events to Function
- Existing OCI Function OCID (`function_id` input)

## Usage

```hcl
module "storage_event_fn" {
  source         = "../oci-storage-event-function"
  compartment_id = "ocid1.compartment.oc1..aaa..."
  function_id    = "ocid1.fnfunc.oc1..aaa..."
  bucket_name    = "my-event-bucket"
  region         = "us-ashburn-1"
}
```

## Apply

```bash
terraform init
terraform plan
terraform apply
```

## Outputs

- `bucket_name`
- `bucket_namespace`
- `events_rule_id`
- `events_action_id`
