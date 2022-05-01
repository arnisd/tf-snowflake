// loader and dbt user accounts with public private keys

resource "snowflake_user" "loader_user" {
  provider     = snowflake.security_admin
  name         = "LOADER"
  login_name   = "LOADER"
  comment      = "loader account"
  disabled     = false
  display_name = "LOADER"

  default_warehouse = "LOADER_WH"
  default_role      = "LOADER"

  #   rsa_public_key   = "..."

  must_change_password = false
}


resource "snowflake_user" "transformer_user" {
  provider     = snowflake.security_admin
  name         = "DBT"
  login_name   = "DBT"
  comment      = "dbt account"
  disabled     = false
  display_name = "DBT"

  default_warehouse = "TRANSFORMER_WH"
  default_role      = "TRANSFORMER"

  #   rsa_public_key   = "..."

  must_change_password = false
}


resource "snowflake_user" "reporter_user" {
  provider     = snowflake.security_admin
  name         = "REPORTER"
  login_name   = "REPORTER"
  comment      = "reprter account"
  disabled     = false
  display_name = "REPORTER"

  default_warehouse = "REPORTER_WH"
  default_role      = "REPORTER"

  #   rsa_public_key   = "..."

  must_change_password = false
}


