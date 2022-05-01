

resource "snowflake_database_grant" "loader_grants" {
  provider = snowflake.security_admin
  for_each = toset(["USAGE", "CREATE SCHEMA", "MONITOR"])

  database_name = snowflake_database.raw_db.name

  privilege = each.key
  roles     = ["LOADER"]

  with_grant_option = false
}


resource "snowflake_database_grant" "transformer_grants" {
  provider = snowflake.security_admin
  for_each = toset(["USAGE", "CREATE SCHEMA", "MONITOR"])

  database_name = snowflake_database.dw_db.name

  privilege = each.key
  roles     = ["TRANSFORMER"]

  with_grant_option = false
}


resource "snowflake_database_grant" "analyst_grants" {
  provider = snowflake.security_admin
  for_each = toset(["USAGE", "MONITOR"])

  database_name = snowflake_database.dw_db.name

  privilege = each.key
  roles     = ["ANALYST"]

  with_grant_option = false
}



resource "snowflake_database_grant" "reporter_grants" {
  provider = snowflake.security_admin
  for_each = toset(["USAGE", "MONITOR"])

  database_name = snowflake_database.dw_db.name

  privilege = each.key
  roles     = ["REPORTER"]

  with_grant_option = false
}


resource "snowflake_schema_grant" "read_only_schema_grants" {
  provider      = snowflake.security_admin
  database_name = snowflake_database.dw_db.name

  privilege = "USAGE"
  roles     = ["REPORTER", "ANALYST"]

  on_future = true
}


resource "snowflake_table_grant" "read_only_table_grants" {
  provider      = snowflake.security_admin
  database_name = snowflake_database.dw_db.name

  privilege = "SELECT"
  roles     = ["REPORTER", "ANALYST"]

  on_future = true
}

