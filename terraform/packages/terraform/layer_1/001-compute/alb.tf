module "aws_alb" {
  source   = "../../../../modules/alb"
  for_each = try(var.alb, {})

  project    = var.project
  vpc_id     = local.remote_vpc[each.value.vpc_name]
  subnet_ids = [for v in try(each.value.subnet_ids, []) : local.remote_subnets[v]]
}