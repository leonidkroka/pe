#!/bin/bash
function set_parameter {
SSM_PARAM_NAME=$1
SSM_VALUE=`aws ssm get-parameters --with-decryption --names "${SSM_PARAM_NAME}" --query "Parameters[*].Value" --output text`
echo "export \"${SSM_PARAM_NAME}\"=\"$SSM_VALUE\"" >> ~/.bashrc
}

set_parameter "DATABASE_HOST"
set_parameter "DATABASE_NAME"
set_parameter "DATABASE_USERNAME"
set_parameter "DATABASE_PASSWORD"
set_parameter "REDIS_URL"
set_parameter "SECRET_KEY_BASE"
