locals {
  vpc_id = lookup(lookup(var.vpc, "main", null), "vpc_id", null)
  app_subnets = [for k,v in lookup(lookup(lookup(lookup(var.vpc, "main", null), "subnets", null), "app", null), "subnet_ids", null): v.id]
}