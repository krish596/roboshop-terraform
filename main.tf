module "components" {
  for_each = var.components
  source = "git::https://github.com/krish596/roboshop-terraform.git"


  zone_id = var.zone_id
  security_group = var.security_group
  name = each.value["name"]
  instance_type = each.value["instance_type"]


}