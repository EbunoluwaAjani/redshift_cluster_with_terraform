locals {
  common_tags = {
    ManagedBy   = "Terraform"
    Project     = "redshift-cluster-provisioning"
    environment = "development"
  }
}
