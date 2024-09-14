default_vpc_id = "vpc-0c4d364ec3aff7983"
default_vpc_cidr = "172.31.0.0/16"
default_vpc_route_table_id = "rtb-08fd73f58449a8a64"
zone_id = "Z084007432GC51JNSYQ6A"
env = "prod"
ssh_ingress_cidr = ["172.31.44.244/32"]
monitoring_ingress_cidr = ["172.31.93.181/32"]
acm_certificate_arn = "arn:aws:acm:us-east-1:014498634764:certificate/79670b86-bec0-4831-a90f-2e29ce88b8d3"
kms_key_id = "arn:aws:kms:us-east-1:014498634764:key/1d8a17d0-166d-43e5-b9e9-d38771f90b2d"

tags = {
  company_name = "ABC Tech"
  business_unit = "Ecommerce"
  project_name = "roboshop"
  cost_created = "ecom_rs"
  created_by = "terraform"
}


vpc = {
  main = {
    cidr = "10.50.0.0/16"
    subnets = {
      public = {
        public1 = { cidr = "10.50.0.0/24", az = "us-east-1a" }
        public2 = { cidr = "10.50.1.0/24", az = "us-east-1b" }
      }
      app = {
        app1 = { cidr = "10.50.2.0/24", az = "us-east-1a" }
        app2 = { cidr = "10.50.3.0/24", az = "us-east-1b" }
      }
      db = {
        db1 = { cidr = "10.50.4.0/24", az = "us-east-1a" }
        db2 = { cidr = "10.50.5.0/24", az = "us-east-1b" }
      }
    }
  }

}



alb = {
  public = {
    internal = false
    lb_type = "application"
    sg_ingress_cidr = ["0.0.0.0/0"]
    sg_port = 443
  }

  private = {
    internal = true
    lb_type = "application"
    sg_ingress_cidr = ["172.31.0.0/16", "10.50.0.0/16"]
    sg_port = 80
  }
}

docdb = {
  main = {
    backup_retention_period = 5
    preferred_backup_window = "07:00-09:00"
    skip_final_snapshot     = true
    engine_version = "4.0.0"
    engine_family      = "docdb4.0"
    instance_count = 1
    instance_class = "db.t3.medium"
  }
}

rds = {
  main = {
    rds_type = "mysql"
    db_port = 3306
    engine = "aurora-mysql"
    engine_family = "aurora-mysql5.7"
    engine_version = "5.7.mysql_aurora.2.11.3"

    skip_final_snapshot = true
    backup_retention_period = 5
    preferred_backup_window = "07:00-09:00"
    instance_count = 1
    instance_class = "db.t3.small"
  }
}

#
elasticache = {
  main = {
    elasticache_type = "redis"
    family           = "redis6.x"
    port             = 6379
    engine           = "redis"
    node_type        = "cache.t3.micro"
    num_cache_nodes  = 1
    engine_version   = "6.2"

  }
}

rabbitmq = {
  main = {

    instance_type = "t3.small"

  }
}

apps = {
  frontend = {
    instance_type = "t3.small"
    port = 80
    desired_capacity   = 2
    max_size           = 10
    min_size           = 2
    lb_priority         = 1
    lb_type             = "public"
    parameters          = ["nexus"]
    tags           = {Monitor_Nginx="yes"}
  }
  catalogue = {
    instance_type = "t3.small"
    port = 8080
    desired_capacity   = 2
    max_size           = 10
    min_size           = 2
    lb_priority         = 2
    lb_type             = "private"
    parameters          = ["docdb", "nexus"]
    tags           = {}
  }
  user = {
    instance_type = "t3.small"
    port = 8080
    desired_capacity   = 2
    max_size           = 10
    min_size           = 2
    lb_priority         = 3
    lb_type             = "private"
    parameters          = ["docdb", "nexus"]
    tags           = {}
  }
  cart = {
    instance_type = "t3.small"
    port = 8080
    desired_capacity   = 2
    max_size           = 10
    min_size           = 2
    lb_priority         = 4
    lb_type             = "private"
    parameters          = ["nexus"]
    tags           = {}
  }
  shipping = {
    instance_type = "t3.medium"
    port = 8080
    desired_capacity   = 2
    max_size           = 10
    min_size           = 2
    lb_priority         = 5
    lb_type             = "private"
    parameters          = ["rds", "nexus"]
    tags           = {}
  }
  payment = {
    instance_type = "t3.small"
    port = 8080
    desired_capacity   = 2
    max_size           = 10
    min_size           = 2
    lb_priority         = 6
    lb_type             = "private"
    parameters          = ["rabbitmq", "nexus"]
    tags           = {}
  }
}