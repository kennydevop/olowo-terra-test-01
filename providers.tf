terraform {
  backend "s3" {
    bucket         = "my-tf-test-bucket-12367"
    dynamodb_table = "olowo-state-lock"
    key            = "global/mystatefile/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}