terraform {
  backend "s3" {
    bucket = "redshift-statefile-bucket"
    key    = "state.tfstate"
   
    region = "eu-central-1"
  }

}