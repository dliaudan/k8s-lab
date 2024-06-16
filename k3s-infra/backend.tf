terraform {
  backend "s3" {
    bucket  = "dliaudanbukcet"
    key     = "terraform-state-folder/terraform.tfstate"
    region  = "eu-north-1"
    profile = "private"
  }
}