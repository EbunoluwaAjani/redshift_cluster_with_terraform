resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

data "aws_ssm_parameter" "redshift_master_username" {
  name            = "/redshift/master_username"
  with_decryption = true
}

resource "aws_ssm_parameter" "redshift_pswrd" {
  name        = "/dev/redshift-cluster/password/master"
  description = "The parameter description"
  type        = "SecureString"
  value       = random_password.password.result

  tags = local.common_tags
}

resource "aws_redshift_cluster" "new_cluster" {
  cluster_identifier = var.cluster_config.cluster_identifier
  database_name      = var.cluster_config.database_name
  master_username    = data.aws_ssm_parameter.redshift_master_username.value
  master_password    = aws_ssm_parameter.redshift_pswrd.value
  node_type          = var.cluster_config.node_type
  cluster_type       = var.cluster_config.cluster_type
  number_of_nodes    = var.cluster_config.number_of_nodes

  tags = local.common_tags
}

