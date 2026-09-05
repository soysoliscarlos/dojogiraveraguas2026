resource "random_string" "prefix" {
  length  = 3
  special = false
  upper   = false
  numeric = true
  lower   = true
}
