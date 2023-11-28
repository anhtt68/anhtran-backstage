project = "backstage-poc"

alb = {
  backstage-poc-alb = {
    vpc_name   = "backstage-poc-vpc"
    subnet_ids = ["10.30.0.0/20", "10.30.16.0/20"]
  }
}

rds = {
  backstage-poc-rds = {
    vpc_name        = "backstage-poc-vpc"
    private_subnets = ["10.30.32.0/20", "10.30.64.0/20", "10.30.0.0/20"]
  }
}

ecs = {
  backstage-poc-ecs = {
    repository_url   = "179623033511.dkr.ecr.ap-northeast-1.amazonaws.com/backstage-poc-ecr"
    docker_image_tag = "backstage_1.0"
    default_region   = "ap-northeast-1"
    vpc_name         = "backstage-poc-vpc"
    bucket_name      = "backstage-poc-data"
  }
}
