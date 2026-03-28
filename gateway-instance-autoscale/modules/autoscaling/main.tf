resource "oci_autoscaling_auto_scaling_configuration" "this" {
  compartment_id = var.compartment_id
  display_name   = "instance-pool-autoscaling"
  is_enabled     = true

  auto_scaling_resources {
    id   = var.instance_pool_id
    type = "instancePool"
  }

  policies {
    display_name = "cpu-scaling-policy"
    policy_type  = "threshold"
    is_enabled   = true

    capacity {
      initial = var.min_size
      min     = var.min_size
      max     = var.max_size
    }

    rules {
      display_name = "scale-out"
      metric {
        metric_type = "CPU_UTILIZATION"
      }
      action {
        type  = "CHANGE_COUNT_BY"
        value = var.scale_out_step
      }
    }

    rules {
      display_name = "scale-in"
      metric {
        metric_type = "CPU_UTILIZATION"
      }
      action {
        type  = "CHANGE_COUNT_BY"
        value = -1 * var.scale_in_step
      }
    }
  }
}
