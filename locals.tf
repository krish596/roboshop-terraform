locals {
  app_subnets = [for k,v in lookup(lookup(lookup(lookup(module.vpc, "main", null), "subnets", null), "app", null), "subnet_ids", null): v.id]
}