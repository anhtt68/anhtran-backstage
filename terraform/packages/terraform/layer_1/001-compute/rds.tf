module "aws_rds" {
  source   = "../../../../modules/rds"
  for_each = try(var.rds, {})

  project                   = var.project
  storage                   = 20
  username                  = data.aws_ssm_parameter.postgres_user.value
  password                  = data.aws_ssm_parameter.postgres_password.value
  subnet_ids                = [for v in try(each.value.private_subnets, []) : local.remote_subnets[v]]
  vpc_id                    = local.remote_vpc[each.value.vpc_name]
  default_security_group_id = module.aws_alb["backstage-poc-alb"].default_security_group_id
}
