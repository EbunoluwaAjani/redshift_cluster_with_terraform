resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}


resource "aws_redshift_cluster" "example" {
  cluster_identifier = "tf-redshift-cluster"
  database_name      = "dev_db"
  master_username    = "exampleuser"
  master_password    = random_password.password.result
  node_type          = "dc2.large"
  cluster_type       = "multi-node"
  number_of_nodes    = 3

  tags = local.common_tags
}

resource "aws_ssm_parameter" "secret" {
  name        = "/dev/redshift-cluster/password/master"
  description = "The parameter description"
  type        = "SecureString"
  value       = random_password.password.result

  tags = local.common_tags
}