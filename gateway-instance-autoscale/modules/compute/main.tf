resource "oci_core_instance_configuration" "this" {
  compartment_id = var.compartment_id
  display_name   = var.instance_configuration_name

  instance_details {
    instance_type = "compute"

    launch_details {
      compartment_id = var.compartment_id
      shape          = var.shape

      dynamic "shape_config" {
        for_each = var.shape_config_enabled ? [1] : []
        content {
          ocpus         = var.ocpus
          memory_in_gbs = var.memory_in_gbs
        }
      }

      source_details {
        source_type = "image"
        image_id    = var.image_id
      }

      create_vnic_details {
        subnet_id        = var.instance_subnet_ids[0]
        nsg_ids          = var.instance_nsg_ids
        assign_public_ip = false
      }

      metadata = {
        ssh_authorized_keys = var.ssh_authorized_keys
        user_data           = var.user_data_base64
      }
    }
  }
}

resource "oci_core_instance_pool" "this" {
  compartment_id            = var.compartment_id
  display_name              = var.instance_pool_name
  instance_configuration_id = oci_core_instance_configuration.this.id
  size                      = var.initial_size

  dynamic "placement_configurations" {
    for_each = var.placement_configurations
    content {
      availability_domain = placement_configurations.value.availability_domain
      primary_subnet_id   = placement_configurations.value.primary_subnet_id
      fault_domains       = try(placement_configurations.value.fault_domains, null)
    }
  }
}
