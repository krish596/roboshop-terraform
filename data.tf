data "aws_subnet" "subnet" {
  filter {
    name   = "vpc-id"
    values = [var.default_vpc_id]
  }
}