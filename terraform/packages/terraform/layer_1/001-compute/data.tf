data "terraform_remote_state" "layer-0" {
  backend = "s3"
  config = {
    region  = "ap-northeast-1"
    bucket  = "backstage-poc-state"
    key     = "layer_0/terraform.tfstate"
    profile = var.profile
  }
}

data "terraform_remote_state" "layer-1-mgmt" {
  backend = "s3"
  config = {
    region  = "ap-northeast-1"
    bucket  = "backstage-poc-state"
    key     = "layer_1/mgmt/terraform.tfstate"
    profile = var.profile
  }
}

locals {
  remote_private_subnets = element([for k, v in data.terraform_remote_state.layer-0.outputs.network : { for k, v in v.private_subnets : k => v.id }], 0)
  remote_public_subnets  = element([for k, v in data.terraform_remote_state.layer-0.outputs.network : { for k, v in v.public_subnets : k => v.id }], 0)
  remote_subnets         = merge([local.remote_private_subnets, local.remote_public_subnets]...)
  remote_vpc             = { for k, v in data.terraform_remote_state.layer-0.outputs.network : k => v.vpc_id }

  remote_iam = data.terraform_remote_state.layer-1-mgmt.outputs.iam
  remote_ssm = data.terraform_remote_state.layer-1-mgmt.outputs.ssm
  remote_s3  = data.terraform_remote_state.layer-1-mgmt.outputs.s3
}

data "aws_ssm_parameter" "postgres_user" {
  name = "POSTGRES_USER"
}

data "aws_ssm_parameter" "postgres_password" {
  name = "POSTGRES_PASSWORD"
}
