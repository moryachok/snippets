terraform {
  backend "s3" {
    bucket = "misha-labs"
    key    = "terraform/terraform.tfstate"
    region = "eu-central-1"
  }
}

provider "aws" {
  region = "eu-central-1"
  profile = "private-aws"  # profile from ~/.aws/credentials file
}

# etc....