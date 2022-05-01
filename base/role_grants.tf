locals {
  role_mapping = {
    "LOADER" = {
      comment    = "Owns the tables in raw schema"
      users      = ["LOADER"]
      depends_on = [snowflake_user.loader_user]
    }
    "TRANSFORMER" = {
      comment    = "Has query permissions on tables in raw schema and owns tables in the analytics schema."
      users      = ["DBT"]
      depends_on = [snowflake_user.transformer_user]
    }
    "REPORTER" = {
      comment = "Has permission to query all table in analystics DW "
      users   = ["REPORTER"]
    }

  }
}


resource "snowflake_role_grants" "role_grant" {
  for_each  = local.role_mapping
  role_name = each.key
  users     = each.value.users
  roles     = []
}

