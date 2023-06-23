terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0" # Optional but recommended in production
    }
  }

  backend "s3" {
    bucket         = "my-terraformstate-dinma-buc"
    key            = "terraform/terraform.tfstate"
    dynamodb_table = "terraform-lock"
    region         = "us-east-2"

  }
}
/*
#To create the bucket. This command method is deprecated
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-terraformstate-dinma-buc"
  acl    = "private"
  versioning {
    enabled = true
  }
  tags = {
    Name        = "My terraform-bucket"
    Environment = "Dev"
  }
} */

/* # A newer command to create bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-terraformstate-dinma-buc"
  tags = {
    Name        = "My terraform-bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "acl" {
  bucket = aws_s3_bucket.my_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.my_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
} */

resource "aws_dynamodb_table" "tf_lock" {
  name           = "terraform-lock"
  hash_key       = "LockID"
  read_capacity  = 3
  write_capacity = 3
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Name = "Terraform Lock Table" #to destroy, add flag --lock=false
  }
  lifecycle {
    prevent_destroy = true #to destroy, change to false
  }
}

# Provider Block
provider "aws" {
  region = "us-east-2"
}



