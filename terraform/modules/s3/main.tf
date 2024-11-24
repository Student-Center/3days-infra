resource "aws_s3_bucket" "image_bucket" {
    bucket = var.bucket_name

    tags = {
        Name        = "threedays-${var.environment}-image-bucket"
        Environment = var.environment
    }
}

resource aws_s3_bucket_ownership_controls image_bucket_ownership_controls {
  bucket   = aws_s3_bucket.image_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource aws_s3_bucket_public_access_block image_bucket_public_access_block {
  bucket   = aws_s3_bucket.image_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource aws_s3_bucket_acl image_bucket_acl {
  depends_on = [
    aws_s3_bucket_ownership_controls.image_bucket_ownership_controls,
    aws_s3_bucket_public_access_block.image_bucket_public_access_block,
  ]
  bucket     = aws_s3_bucket.image_bucket.id
  acl        = "public-read"
}
