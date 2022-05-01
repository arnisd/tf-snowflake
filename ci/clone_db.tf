resource "snowflake_database" "prod_clone" {
  provider      = snowflake.sys_admin
  name          = "${var.company_name}_DW_CLONE"
  comment       = "clone of prod"
  from_database = "${var.company_name}_DW"
}


resource "snowflake_database_grant" "grant_analyst" {
  provider      = snowflake.security_admin
  database_name = "${var.company_name}_DW_CLONE"

  privilege = "CREATE SCHEMA"
  roles     = ["ANALYST"]

  with_grant_option = true

  depends_on = [snowflake_database.prod_clone]
}

resource "snowflake_schema_grant" "grant_analyst" {
  provider      = snowflake.security_admin
  database_name = "${var.company_name}_DW_CLONE"

  privilege = "OWNERSHIP"
  roles     = ["ANALYST"]

  on_future         = true
  with_grant_option = true

  depends_on = [snowflake_database.prod_clone]

}

