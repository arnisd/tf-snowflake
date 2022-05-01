locals {
  users = {
    "ARNIS" = {
      login_name = "ARNIS"
      role       = "ANALYST"
      warehouse  = "ANALYST_WH"
    }
    "DIZDARI" = {
      login_name = "DIZDARI"
      role       = "ANALYST"
      warehouse  = "ANALYST_WH"
    }
  }
}

resource "snowflake_user" "user" {
  for_each = local.users
  provider = snowflake.security_admin

  name              = each.key
  login_name        = each.value.login_name
  default_role      = each.value.role
  default_warehouse = each.value.warehouse


  must_change_password = true
  password             = "password"


}


