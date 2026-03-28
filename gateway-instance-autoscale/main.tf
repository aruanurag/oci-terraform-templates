provider "oci" {}

module "networking" {
  source = "./modules/networking"

  compartment_id      = var.compartment_id
  vcn_id              = var.vcn_id
  nlb_subnet_id        = var.nlb_subnet_id
  instance_subnet_ids  = var.instance_subnet_ids
  nlb_nsg_ids          = var.nlb_nsg_ids
  instance_nsg_ids     = var.instance_nsg_ids
}

module "compute" {
  source = "./modules/compute"

  compartment_id              = var.compartment_id
  instance_pool_name          = var.instance_pool_name
  instance_configuration_name = var.instance_configuration_name
  instance_subnet_ids         = module.networking.instance_subnet_ids
  availability_domains        = var.availability_domains

  shape             = var.instance_shape
  ocpus             = var.instance_ocpus
  memory_in_gbs     = var.instance_memory_in_gbs
  image_id          = var.instance_image_id
  ssh_authorized_keys = var.ssh_authorized_keys
  user_data_base64  = var.user_data_base64

  instance_nsg_ids   = module.networking.instance_nsg_ids
  initial_size       = var.instance_pool_initial_size
  placement_configurations = var.placement_configurations
}

module "autoscaling" {
  source = "./modules/autoscaling"

  compartment_id    = var.compartment_id
  instance_pool_id  = module.compute.instance_pool_id

  min_size          = var.autoscaling_min_size
  max_size          = var.autoscaling_max_size
  target_cpu        = var.autoscaling_target_cpu
  scale_out_step    = var.autoscaling_scale_out_step
  scale_in_step     = var.autoscaling_scale_in_step
}

module "nlb" {
  source = "./modules/nlb"

  compartment_id     = var.compartment_id
  nlb_name           = var.nlb_name
  nlb_subnet_id      = module.networking.nlb_subnet_id
  nlb_nsg_ids        = module.networking.nlb_nsg_ids

  listener_port      = var.listener_port
  backend_port       = var.backend_port
  backend_ips        = var.backend_ips
}

module "iam" {
  source = "./modules/iam"

  compartment_id     = var.compartment_id
  policy_name        = var.policy_name
  policy_description = var.policy_description
  policy_statements  = var.policy_statements
}
