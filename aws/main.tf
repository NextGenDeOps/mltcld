provider "aws" {
  version = "~> 1.56"
  region  = "us-west-1"
}

resource "aws_iam_user" "app-access" {
  name = "tf-app-access"
}

resource "aws_s3_bucket" "b" {
  bucket = "jm-tf-test-bucket"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT", "POST"]
    allowed_origins = ["https://s3-website-test.hashicorp.com"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }

  versioning {
    enabled = true
  }

  logging {
    # target_bucket = "${aws_s3_bucket.log_bucket.id}"
    target_bucket = "jm-tf-test-bucket"
    target_prefix = "log/"
  }
}