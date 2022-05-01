// want to have two basic 

// <company_name>_raw, <company_name>_dw 


resource "snowflake_database" "raw_db" {
  provider = snowflake.sys_admin
  name     = "${var.company_name}_RAW"
}


resource "snowflake_database" "dw_db" {
  provider = snowflake.sys_admin
  name     = "${var.company_name}_DW"
}

