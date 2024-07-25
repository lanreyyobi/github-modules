# Terraform state storage bucket
resource "aws_s3_bucket" "bucket" {
  bucket = "${var.team}-${random_pet.bucket_name.id}-${random_integer.bucket_int.result}"

  tags = {
    Name        = var.my_bucket
    Environment = var.env
  }
}

resource "random_pet" "bucket_name" {
  prefix = "wemadevops"
  length = 2
}

resource "random_integer" "bucket_int" {
  max = 500
  min = 1
}

resource "aws_sns_topic" "topic" {
  name              = var.topic_name
}

