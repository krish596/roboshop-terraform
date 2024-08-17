locals {
  vpc_id = lookup(lookup(var.vpc, "main", null), "vpc_id", null)
}