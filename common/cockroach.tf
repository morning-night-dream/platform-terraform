terraform {
  required_providers {
    cockroach = {
      source  = "cockroachdb/cockroach"
      version = "0.2.0"
    }
  }
}

variable "sql_user_password" {
  type      = string
  nullable  = false
  sensitive = true
}

variable "serverless_spend_limit" {
  type     = number
  nullable = false
  default  = 0
}

variable "cloud_provider" {
  type     = string
  nullable = false
  default  = "GCP"
}

variable "cloud_provider_regions" {
  type     = list(string)
  nullable = false
  default  = ["asia-southeast1"]
}

provider "cockroach" {
  # export COCKROACH_API_KEY with the cockroach cloud API Key
}

resource "cockroach_cluster" "db" {
  name           = "${var.project_env}-platform-db"
  cloud_provider = var.cloud_provider
  serverless = {
    spend_limit = var.serverless_spend_limit
  }
  regions = [for r in var.cloud_provider_regions : { name = r }]
}

resource "cockroach_sql_user" "db_user" {
  id       = cockroach_cluster.db.id
  name     = "${var.project_env}-platform-db"
  password = var.sql_user_password
}
