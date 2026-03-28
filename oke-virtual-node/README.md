# oke-virtual-node

This template creates an OKE cluster with a virtual node pool, using existing networking resources.

Module structure:
- networking: validates and exposes existing VCN and subnet inputs
- oke: creates the OKE cluster and virtual node pool
- iam: creates the IAM policy needed for OKE and virtual nodes

Architecture tree:
oke-virtual-node/
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
  - oke/
    - main.tf
    - variables.tf
    - outputs.tf
  - iam/
    - main.tf
    - variables.tf
    - outputs.tf

Prerequisites:
- OCI tenancy with permissions to create OKE clusters and IAM policies
- Existing VCN and subnets for endpoint, service LB, and virtual nodes

IAM policy statements (default in variables.tf):
- Allow service OKE to manage cluster-family in compartment id <compartment_ocid>
- Allow service OKE to manage virtual-network-family in compartment id <compartment_ocid>
- Allow service OKE to use subnets in compartment id <compartment_ocid>
- Allow service OKE to use network-security-groups in compartment id <compartment_ocid>
- Allow service OKE to use instance-family in compartment id <compartment_ocid>

Usage:
module "oke_virtual_node" {
  source = "./oke-virtual-node"

  compartment_id       = "ocid1.compartment.oc1..example"
  vcn_id               = "ocid1.vcn.oc1..example"
  endpoint_subnet_id   = "ocid1.subnet.oc1..example"
  service_lb_subnet_id = "ocid1.subnet.oc1..example"
  worker_subnet_ids    = ["ocid1.subnet.oc1..example"]
  pod_subnet_ids       = ["ocid1.subnet.oc1..example"]
  nsg_ids              = ["ocid1.nsg.oc1..example"]

  cluster_name         = "example-oke"
  kubernetes_version   = "v1.28.2"
  endpoint_is_public     = false
  virtual_node_pool_name = "example-vnp"
  virtual_node_size      = "MEDIUM"
  pod_shape              = "CI.Standard.E4.Flex"
  placement_configurations = [
    {
      availability_domain = "Uocm:PHX-AD-1"
      subnet_id           = "ocid1.subnet.oc1..example"
    }
  ]
}

Outputs:
- cluster_id
- virtual_node_pool_id
- endpoint_config
- policy_id
