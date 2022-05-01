locals {
  roles = {
    "ANALYST" = {
      comment = "Read only access"
      users   = ["ARNIS", "DIZDARI"]
    }
  }
}




resource "snowflake_role_grants" "role_grant" {
  provider  = snowflake.security_admin
  for_each  = local.roles
  role_name = each.key
  users     = each.value.users
  roles     = []
  depends_on = [
    snowflake_user.user,
  ]
}

