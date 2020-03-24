##############################################
### Standard variables for all AWS modules ###
##############################################

variable "name_prefix" {
  description = "Standard `name_prefix` module input."
  type        = string
}
variable "environment" {
  description = "Standard `environment` module input."
  type = object({
    vpc_id          = string
    aws_region      = string
    public_subnets  = list(string)
    private_subnets = list(string)
  })
}
variable "resource_tags" {
  description = "Standard `resource_tags` module input."
  type        = map(string)
}

########################################
### Custom variables for this module ###
########################################


variable "admin_username" {
  description = "The initial admin username."
  type        = string
}
variable "admin_password" {
  description = "The initial admin password. Must be 8 characters long."
  type        = string
  default     = null
}
variable "elastic_ip" {
  description = "Optional. An Elastic IP endpoint which will be used to for routing incoming traffic."
  type        = string
  default     = null
}
variable "identifier" {
  description = "The database name which will be used within connection strings and URLs."
  default     = "rds-postgres-db"
}
variable "instance_class" {
  description = "Enter the desired node type. The default and cheapest option is 'db.t2.micro' @ ~$0.017/hr, or ~$120/mo (https://aws.amazon.com/rds/mysql/pricing/ )"
  type        = string
  default     = "db.t2.micro"
}
variable "jdbc_port" {
  description = "Optional. Overrides the default JDBC port for incoming SQL connections."
  default     = 5432
}
variable "kms_key_id" {
  description = "Optional. The ARN for the KMS encryption key used in cluster encryption."
  type        = string
  default     = null
}
variable "postgres_version" {
  description = "Optional. Overrides the version of the Postres database engine."
  default     = "11.5"
}

variable "s3_logging_bucket" {
  description = "Optional. An S3 bucket to use for log collection."
  type        = string
  default     = null
}
variable "s3_logging_path" {
  description = "Required if `s3_logging_bucket` is set. The path within the S3 bucket to use for log storage."
  type        = string
  default     = null
}
variable "storage_size_in_gb" {
  description = "The allocated storage value is denoted in GB"
  type        = string
  default     = "10"
}
variable "skip_final_snapshot" {
  description = "If true, will allow terraform to destroy the RDS cluster without performing a final backup."
  default     = false
}