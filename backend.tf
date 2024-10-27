terraform {
  backend "s3" {
    bucket         = "pium-tf-az"
    key            = "tfaz/terraform.tfstate"
    region         = "ap-southeast-1"
    encrypt        = true
    dynamodb_table = "tf-az-lock"
  }
}
