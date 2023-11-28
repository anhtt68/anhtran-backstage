resource "aws_ssm_parameter" "postgres_host" {
  name  = "POSTGRES_HOST"
  type  = "String"
  value = var.postgres_host

  lifecycle {
    ignore_changes = [value]
  }
}

resource "aws_ssm_parameter" "postgres_user" {
  name  = "POSTGRES_USER"
  type  = "SecureString"
  value = var.postgres_user

  lifecycle {
    ignore_changes = [value]
  }
}

resource "aws_ssm_parameter" "postgres_password" {
  name  = "POSTGRES_PASSWORD"
  type  = "SecureString"
  value = var.postgres_password

  lifecycle {
    ignore_changes = [value]
  }
}

resource "aws_ssm_parameter" "github_token" {
  name  = "GITHUB_TOKEN"
  type  = "SecureString"
  value = var.github_token

  lifecycle {
    ignore_changes = [value]
  }
}

resource "aws_ssm_parameter" "github_client_id" {
  name  = "AUTH_GITHUB_CLIENT_ID"
  type  = "SecureString"
  value = var.github_client_id

  lifecycle {
    ignore_changes = [value]
  }
}

resource "aws_ssm_parameter" "github_client_secret" {
  name  = "AUTH_GITHUB_CLIENT_SECRET"
  type  = "SecureString"
  value = var.github_client_secret

  lifecycle {
    ignore_changes = [value]
  }
}

resource "aws_ssm_parameter" "access_key_id" {
  name  = "ACCESS_KEY_ID"
  type  = "SecureString"
  value = var.access_key_id

  lifecycle {
    ignore_changes = [value]
  }
}

resource "aws_ssm_parameter" "secret_access_key" {
  name  = "SECRET_ACCESS_KEY"
  type  = "SecureString"
  value = var.secret_access_key

  lifecycle {
    ignore_changes = [value]
  }
}