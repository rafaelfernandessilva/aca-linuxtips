terraform {

  backend "s3" {
    bucket = "devops-teste-9999"
    key    = "vpc/dev/state"
    region = "us-east-1"
  }
}

