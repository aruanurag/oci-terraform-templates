provider "oci" {}

module "networking" {
  source = "./modules/networking"

  compartment_id       = var.compartment_id
  vcn_id               = var.vcn_id
  endpoint_subnet_id   = var.endpoint_subnet_id
  service_lb_subnet_id = var.service_lb_subnet_id
  worker_subnet_ids    = var.worker_subnet_ids
  pod_subnet_ids       = var.pod_subnet_ids
  nsg_ids              = var.nsg_ids
}

module "oke" {
  source = "./modules/oke"

  compartment_id         = var.compartment_id
  cluster_name           = var.cluster_name
  kubernetes_version     = var.kubernetes_version
  vcn_id                 = module.networking.vcn_id
  endpoint_subnet_id     = module.networking.endpoint_subnet_id
  service_lb_subnet_id   = module.networking.service_lb_subnet_id
  pod_subnet_ids         = module.networking.pod_subnet_ids
  worker_subnet_ids      = module.networking.worker_subnet_ids
  nsg_ids                = module.networking.nsg_ids
  endpoint_is_public       = var.endpoint_is_public
  virtual_node_pool_name   = var.virtual_node_pool_name
  virtual_node_size        = var.virtual_node_size
  pod_shape                = var.pod_shape
  placement_configurations = var.placement_configurations
}

module "iam" {
  source = "./modules/iam"

  compartment_id     = var.compartment_id
  policy_statements  = var.policy_statements
  policy_name        = var.policy_name
  policy_description = var.policy_description
}
