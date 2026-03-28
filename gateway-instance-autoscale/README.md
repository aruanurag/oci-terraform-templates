# gateway-instance-autoscale

This template creates a Network Load Balancer (gateway) and a backend instance pool with autoscaling, using existing networking resources.

Module structure:
- networking: pass-through for existing network IDs
- compute: instance configuration + instance pool
- autoscaling: autoscaling configuration for the pool
- nlb: network load balancer + listener + backend set
- iam: IAM policy statements

Architecture tree:
gateway-instance-autoscale/
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
  - compute/
    - main.tf
    - variables.tf
    - outputs.tf
  - autoscaling/
    - main.tf
    - variables.tf
    - outputs.tf
  - nlb/
    - main.tf
    - variables.tf
    - outputs.tf
  - iam/
    - main.tf
    - variables.tf
    - outputs.tf

Prerequisites:
- OCI tenancy with permissions to create instance pools, autoscaling configs, and NLBs
- Existing VCN and subnets

IAM policy statements (default in variables.tf):
- Allow service autoscaling to manage instance-pools in compartment id <compartment_ocid>
- Allow service autoscaling to read metrics in compartment id <compartment_ocid>
- Allow service compute to manage instance-family in compartment id <compartment_ocid>
- Allow service compute to use subnets in compartment id <compartment_ocid>
- Allow service compute to use network-security-groups in compartment id <compartment_ocid>
- Allow service network-load-balancer to use subnets in compartment id <compartment_ocid>
- Allow service network-load-balancer to use network-security-groups in compartment id <compartment_ocid>

Usage:
module "gateway_instance_autoscale" {
  source = "./gateway-instance-autoscale"

  compartment_id      = "ocid1.compartment.oc1..example"
  vcn_id              = "ocid1.vcn.oc1..example"
  nlb_subnet_id        = "ocid1.subnet.oc1..example"
  instance_subnet_ids  = ["ocid1.subnet.oc1..example"]
  availability_domains = ["Uocm:PHX-AD-1"]

  instance_shape       = "VM.Standard.E4.Flex"
  instance_ocpus       = 1
  instance_memory_in_gbs = 8
  instance_image_id    = "ocid1.image.oc1..example"
  ssh_authorized_keys  = "ssh-rsa AAAA..."

  placement_configurations = [
    {
      availability_domain = "Uocm:PHX-AD-1"
      primary_subnet_id   = "ocid1.subnet.oc1..example"
    }
  ]
}

Outputs:
- nlb_id
- instance_pool_id
- autoscaling_configuration_id
- iam_policy_id
