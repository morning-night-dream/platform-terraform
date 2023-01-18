variable "upstash_email" {
  type      = string
  nullable  = false
  sensitive = true
}

variable "upstash_api_key" {
  type      = string
  nullable  = false
  sensitive = true
}

variable "upstash_region" {
  type     = string
  nullable = false
  default  = "ap-northeast-1"
}

provider "upstash" {
  email   = var.upstash_email
  api_key = var.upstash_api_key
}

resource "upstash_database" "upstash" {
  database_name = "platform-${var.env}"
  region        = var.upstash_region
  tls           = "true"
  multi_zone    = "false"
}