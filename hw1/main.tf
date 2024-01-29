terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.34.0"
    }
  }
}

provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_s3_bucket" "first-bucket" {
  bucket = var.bucket_name
  tags = {
    Name        = "Faran First Bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "bucket_config" {
  bucket = aws_s3_bucket.first-bucket.id

  rule {
    id     = var.bucket-config-id
    status = var.bucket-status
    expiration {
      days = var.bucket-expiry
    }
    filter {
      and {
        prefix                   = "log/"
        object_size_greater_than = var.min-file-size
        object_size_less_than    = var.max-file-size
        tags = {
          rule      = "log"
          autoclean = "true"
        }
      }
    }
  }
}



resource "aws_redshift_cluster" "first_redshift_cluster" {
  cluster_identifier        = var.cluster-id
  database_name             = var.db-name
  master_username           = var.db-username
  master_password           = var.db-password
  node_type                 = var.cluster-node-type
  cluster_type              = var.cluster-type
  final_snapshot_identifier = var.final-snapshot-id
}