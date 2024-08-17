output "vpc" {
  value = lookup(lookup(module.vpc, "main", null), "vpc_id", null)
}