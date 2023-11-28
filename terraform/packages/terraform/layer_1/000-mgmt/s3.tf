module "aws_s3" {
  source   = "../../../../modules/s3"
  for_each = try(var.s3, {})

  project = var.project
  name    = each.value.name
}