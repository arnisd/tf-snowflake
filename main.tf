terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.32.0"
    }
  }
}

module "base_setup" {
  source       = "./base"
  company_name = "TERRADATA"
}

provider "snowflake" {
  alias = "security_admin"
  role  = "SECURITYADMIN"
}

provider "snowflake" {
  alias = "sys_admin"
  role  = "SYSADMIN"
}

