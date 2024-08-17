locals {
  vpc_id = lookup(lookup(var.vpc, "main", null), "vpc_id", null)
  app_subnets = lookup(lookup(var.vpc, "main", null), "subnets", null)
}