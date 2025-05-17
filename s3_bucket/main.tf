terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.0.0-beta1"
    }
  }
}

provider "aws" {
  region = "eu-west-3"
}


resource "aws_s3_bucket" "mon_bucket" {
  bucket = "farid-mon-super-bucket-unique-2025"

  tags = {
    Nom          = "BucketDemo"
    Environnement = "Dev"
  }
}

