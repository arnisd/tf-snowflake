# tf-snowflake
Example project of Terraform Snowflake 

# Create the public/private pair 

$ cd ~/.ssh
$ openssl genrsa 2048 | openssl pkcs8 -topk8 -inform PEM -out snowflake_tf_snow_key.p8 -nocrypt
$ openssl rsa -in snowflake_tf_snow_key.p8 -pubout -out snowflake_tf_snow_key.pub

# Create User in Snowflake

CREATE USER "tf-snow" RSA_PUBLIC_KEY='' DEFAULT_ROLE=PUBLIC MUST_CHANGE_PASSWORD=FALSE;

GRANT ROLE SYSADMIN TO USER "tf-snow";
GRANT ROLE SECURITYADMIN TO USER "tf-snow";
GRANT ROLE ACCOUNTADMIN TO USER "tf-snow";

# Create ENV file using following 

SELECT current_account() as YOUR_ACCOUNT_LOCATOR, current_region() as YOUR_SNOWFLAKE_REGION_ID;

$ export SNOWFLAKE_USER="tf-snow"
$ export SNOWFLAKE_PRIVATE_KEY_PATH="~/.ssh/snowflake_tf_snow_key"
$ export SNOWFLAKE_ACCOUNT="YOUR_ACCOUNT_LOCATOR"
$ export SNOWFLAKE_REGION="YOUR_REGION_HERE"


