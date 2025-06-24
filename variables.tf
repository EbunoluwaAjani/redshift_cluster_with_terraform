variable "cluster_config" {

  type = object({
    cluster_identifier = string
    database_name      = string
    node_type          = string
    cluster_type       = string
    number_of_nodes    = number

  })
  default = {
    cluster_identifier = "tf-redshift-cluster"
    database_name      = "dev_db"
    node_type          = "dc2.large"
    cluster_type       = "multi-node"
    number_of_nodes    = 3
  }
}

