resource "oci_network_load_balancer_network_load_balancer" "this" {
  compartment_id = var.compartment_id
  display_name   = var.nlb_name
  subnet_id      = var.nlb_subnet_id
  is_private     = true
}

resource "oci_network_load_balancer_backend_set" "this" {
  name                     = "backend-set"
  network_load_balancer_id = oci_network_load_balancer_network_load_balancer.this.id
  policy                   = "FIVE_TUPLE"

  health_checker {
    protocol = "TCP"
    port     = var.backend_port
  }
}

resource "oci_network_load_balancer_listener" "this" {
  name                     = "listener"
  network_load_balancer_id = oci_network_load_balancer_network_load_balancer.this.id
  default_backend_set_name = oci_network_load_balancer_backend_set.this.name
  port                     = var.listener_port
  protocol                 = "TCP"
}

resource "oci_network_load_balancer_backend" "this" {
  for_each                 = toset(var.backend_ips)
  network_load_balancer_id = oci_network_load_balancer_network_load_balancer.this.id
  backend_set_name         = oci_network_load_balancer_backend_set.this.name

  ip_address = each.value
  port       = var.backend_port
}
