resource "aws_s3_bucket" "demo_bucket" {
  bucket = "static-website-terraform-demo"
  policy = file("policy.json")

  website {
    index_document = "index.html"
    error_document = "error.html"
  }


  tags = {
    "Name" = "static_website"
  }
}

resource "aws_s3_bucket_policy" "demo_bucket_policy" {
  bucket = aws_s3_bucket.demo_bucket.id
  policy = file("policy.json")
}

resource "aws_s3_bucket_acl" "demo_bucket_acl" {
  bucket = aws_s3_bucket.demo_bucket.id
  acl    = "public-read"
}

resource "aws_s3_bucket_versioning" "demo_bucket_versioning" {
  bucket = aws_s3_bucket.demo_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}