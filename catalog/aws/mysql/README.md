
# AWS MySQL

`/catalog/aws/mysql`

## Overview


Deploys a MySQL server running on RDS.

* NOTE: Requires AWS policy 'AmazonRDSFullAccess' on the terraform account

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| admin\_password | The initial admin password. Must be 8 characters long. | `string` | n/a | yes |
| admin\_username | The initial admin username. | `string` | n/a | yes |
| environment | Standard `environment` module input. | <pre>object({<br>    vpc_id          = string<br>    aws_region      = string<br>    public_subnets  = list(string)<br>    private_subnets = list(string)<br>  })</pre> | n/a | yes |
| kms\_key\_id | Optional. The ARN for the KMS encryption key used in cluster encryption. | `string` | n/a | yes |
| name\_prefix | Standard `name_prefix` module input. | `string` | n/a | yes |
| resource\_tags | Standard `resource_tags` module input. | `map(string)` | n/a | yes |
| identifier | The database name which will be used within connection strings and URLs. | `string` | `"rds-db"` | no |
| instance\_class | Enter the desired node type. The default and cheapest option is 'db.t2.micro' @ ~$0.017/hr, or ~$120/mo (https://aws.amazon.com/rds/mysql/pricing/ ) | `string` | `"db.t2.micro"` | no |
| jdbc\_port | Optional. Overrides the default JDBC port for incoming SQL connections. | `number` | `3306` | no |
| mysql\_version | Optional. The specific MySQL version to use. | `string` | `"5.7.26"` | no |
| skip\_final\_snapshot | If true, will allow terraform to destroy the RDS cluster without performing a final backup. | `bool` | `false` | no |
| storage\_size\_in\_gb | The allocated storage value is denoted in GB. | `string` | `"20"` | no |

## Outputs

| Name | Description |
|------|-------------|
| endpoint | The MySQL connection endpoint for the new server. |
| summary | Summary of resources created by this module. |

---------------------

## Source Files

_Source code for this module is available using the links below._

* [main.tf](main.tf)
* [outputs.tf](outputs.tf)
* [variables.tf](variables.tf)

---------------------

_**NOTE:** This documentation was auto-generated using
`terraform-docs` and `s-infra` from `slalom.dataops`.
Please do not attempt to manually update this file._