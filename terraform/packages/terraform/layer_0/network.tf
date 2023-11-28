module "aws_vpc" {
  source   = "../../../modules/vpc"
  for_each = try(var.vpc, {})

  project         = var.project
  vpc_cidr_block  = each.value.vpc_cidr_block
  public_subnets  = each.value.public_subnets
  private_subnets = each.value.private_subnets
}