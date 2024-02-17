resource "aws_s3_bucket" "olowo-bucket" {
  bucket = "my-tf-test-bucket-12367"

  tags = {
    Name        = "My olowo bucket"
    Environment = "uat"
  }
}