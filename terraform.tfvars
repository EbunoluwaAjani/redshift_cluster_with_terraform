cluster_config = {
  cluster_identifier = "prod-redshift-cluster"
  database_name      = "prod_db"
  node_type          = "dc1.large"
  cluster_type       = "single-node"
  number_of_nodes    = 1
}
