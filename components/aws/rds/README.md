
# AWS RDS

`/components/aws/rds`

## Overview


Deploys an RDS-backed database. RDS currently supports the following database engines:
* Aurora
* MySQL
* PostgreSQL
* Oracle
* SQL Server

Each engine type has it's own required configuration. For already-configured database
configurations, see the catalog modules: `catalog/aws/mysql` and `catalog/aws/postgres`
which are built on top of this component module.

* NOTE: Requires AWS policy 'AmazonRDSFullAccess' on the terraform account

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| admin\_password | The initial admin password. Must be 8 characters long. | `string` | n/a | yes |
| admin\_username | The initial admin username. | `string` | n/a | yes |
| engine | The type of database to launch. E.g.: `aurora`, `aurora-mysql`,`aurora-postgresql`, `mariadb`,`mysql`,`oracle-ee`,`oracle-se2`,`oracle-se1`,`oracle-se`,`postgres`, `sqlserver-ee`,`sqlserver-se`,`sqlserver-ex`,`sqlserver-web`.<br>Check RDS documentation for updates to the supported list, and for details on each engine type. | `string` | n/a | yes |
| engine\_version | When paired with `engine`, specifies the version of the database engine to deploy. | `string` | n/a | yes |
| environment | Standard `environment` module input. | <pre>object({<br>    vpc_id          = string<br>    aws_region      = string<br>    public_subnets  = list(string)<br>    private_subnets = list(string)<br>  })</pre> | n/a | yes |
| jdbc\_port | Optional. Overrides the default JDBC port for incoming SQL connections. | `string` | n/a | yes |
| kms\_key\_id | Optional. The ARN for the KMS encryption key used in cluster encryption. | `string` | n/a | yes |
| name\_prefix | Standard `name_prefix` module input. | `string` | n/a | yes |
| resource\_tags | Standard `resource_tags` module input. | `map(string)` | n/a | yes |
| identifier | The database name which will be used within connection strings and URLs. | `string` | `"rds-db"` | no |
| instance\_class | Enter the desired node type. The default and cheapest option is 'db.t2.micro' @ ~$0.017/hr, or ~$120/mo (https://aws.amazon.com/rds/mysql/pricing/ ) | `string` | `"db.t2.micro"` | no |
| skip\_final\_snapshot | If true, will allow terraform to destroy the RDS cluster without performing a final backup. | `bool` | `false` | no |
| storage\_size\_in\_gb | The allocated storage value is denoted in GB | `string` | `"20"` | no |

## Outputs

| Name | Description |
|------|-------------|
| endpoint | The connection endpoint for the new RDS instance. |
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