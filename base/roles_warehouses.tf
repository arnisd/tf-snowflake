// want to have these basic roles 

// loader to load data into raw database 

// transformer to transform in 


locals {
  roles = {
    "LOADER" = {
      comment = "Owns the tables in raw dw"
    }
    "TRANSFORMER" = {
      comment = "Owns tables in dw db and has read access to raw"
    }
    "REPORTER" = {
      comment = "only has read only access to dw"
    }
    "ANALYST" = {
      comment = "Same as reporter"
    }
  }
}

resource "snowflake_role" "base_roles" {
  for_each = local.roles
  provider = snowflake.security_admin
  name     = each.key
  comment  = each.value.comment
}

resource "snowflake_warehouse" "base_warehouses" {

  for_each                            = local.roles
  provider                            = snowflake.sys_admin
  auto_resume                         = true
  auto_suspend                        = 60
  max_concurrency_level               = 8
  name                                = "${each.key}_WH"
  statement_queued_timeout_in_seconds = 0
  statement_timeout_in_seconds        = 36000
  warehouse_size                      = "X-Small"
  initially_suspended                 = true
}

resource "snowflake_warehouse_grant" "grant" {

  depends_on = [
    snowflake_warehouse.base_warehouses, snowflake_role.base_roles
  ]
  for_each = local.roles
  provider = snowflake.sys_admin

  warehouse_name = "${each.key}_WH"
  privilege      = "USAGE"

  roles = [
    each.key,
  ]

}


