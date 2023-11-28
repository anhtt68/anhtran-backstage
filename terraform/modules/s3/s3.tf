resource "aws_s3_bucket" "this" {
  bucket = var.name
  tags = {
    Name = var.name
  }
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket                  = var.name
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
  depends_on              = [ aws_s3_bucket.this ]
}