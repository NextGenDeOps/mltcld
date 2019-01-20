provider "aws" {
  version = "~> 1.56"
  region  = "us-east-1"
}

resource "aws_iam_user" "app-access" {
  name = "tf-app-access"
}

