resource snowflake_resource_monitor base_monitor {
  provider = snowflake.account_admin
  name         = "base_monitor"
  credit_quota = 100

  frequency       = "DAILY"
  start_timestamp = "Immediately"

  notify_triggers            = [50]
  suspend_triggers           = [80]
  suspend_immediate_triggers = [90]

  depends_on = [snowflake_warehouse.base_warehouses]

}


