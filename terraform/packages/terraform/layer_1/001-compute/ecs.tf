module "aws_ecs" {
  source   = "../../../../modules/ecs"
  for_each = try(var.ecs, {})

  project                  = var.project
  docker_image_url         = each.value.repository_url
  docker_image_tag         = each.value.docker_image_tag
  default_region           = each.value.default_region
  vpc_id                   = local.remote_vpc[each.value.vpc_name]
  security_group_ids       = [module.aws_alb["backstage-poc-alb"].default_security_group_id]
  subnet_ids               = [for v in try(each.value.subnet_ids, []) : local.remote_subnets[v]]
  execution_role_arn       = local.remote_iam.ecs_role_arn
  postgres_host_arn        = local.remote_ssm.postgres_host_arn
  postgres_user_arn        = local.remote_ssm.postgres_user_arn
  postgres_password_arn    = local.remote_ssm.postgres_password_arn
  github_token_arn         = local.remote_ssm.github_token_arn
  github_client_id_arn     = local.remote_ssm.github_client_id_arn
  github_client_secret_arn = local.remote_ssm.github_client_secret_arn
  tech_docs_bucket_name    = each.value.bucket_name
  access_key_id_arn        = local.remote_ssm.access_key_id_arn
  secret_access_key_arn    = local.remote_ssm.secret_access_key_arn
  target_group_arn         = module.aws_alb["backstage-poc-alb"].target_group_arn
  alb_dns_name             = module.aws_alb["backstage-poc-alb"].alb_dns_name
}