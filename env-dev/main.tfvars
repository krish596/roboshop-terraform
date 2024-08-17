vpc = {
  main = {
    cidr = "10.0.0.0/16"
    subnets = {
      public = {
        public1 = { cidr = "10.0.0.0/24", az = "us-east-1a" }
        public2 = { cidr = "10.0.1.0/24", az = "us-east-1b" }
      }
      app = {
        app1 = { cidr = "10.0.2.0/24", az = "us-east-1a" }
        app2 = { cidr = "10.0.3.0/24", az = "us-east-1b" }
      }
      db = {
        db1 = { cidr = "10.0.4.0/24", az = "us-east-1a" }
        db2 = { cidr = "10.0.5.0/24", az = "us-east-1b" }
      }
    }
  }


}

default_vpc_id = "vpc-0c4d364ec3aff7983"
default_vpc_cidr = "172.31.0.0/16"
default_vpc_route_table_id = "rtb-08fd73f58449a8a64"


tags = {
  company_name = "ABC Tech"
  business_unit = "Ecommerce"
  project_name = "roboshop"
  cost_center = "ecom_rs"
  created_by = "terraform"
}

env = "dev"

