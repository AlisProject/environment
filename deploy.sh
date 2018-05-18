#!/usr/bin/env bash

# SSMに登録するパラメータのPrefixは、ALIS_APP_IDを含めた値とする
SSM_PARAMS_PREFIX=${ALIS_APP_ID}ssm

aws cloudformation deploy --template-file template.yaml \
  --capabilities CAPABILITY_IAM \
  --stack-name ${SSM_PARAMS_PREFIX}
