# Terraform Redshift Cluster Provisioning

Provision an **Amazon Redshift** cluster using **Terraform**, with secure credential handling and remote state management.

---

## Stack

- **Terraform**: `>= 1.0`
- **AWS Provider**: `>= 5.0.0, <= 6.0.0`
- **Random Provider**: `~> 3.7.0`
- **AWS Services**:
  - Redshift
  - S3 (for remote state)
  - SSM Parameter Store (for secrets)

---

## Features

- **Secure password generation** via `random_password`
- **Store credentials in SSM Parameter Store** (SecureString)
- **Remote state backend** in S3 (`eu-central-1`)
- **Consistent tagging** across resources
- **Flexible cluster config** (single/multi-node, node type)

---

## Tags (via `local.common_tags`)

```hcl
{
  ManagedBy   = "Terraform"
  Project     = "redshift-cluster-provisioning"
  environment = "development"
}
