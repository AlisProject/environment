#!/usr/bin/env bash
set -eu

# Rest API
LAMBDA_ROLE_ARN=`aws iam list-roles | grep ${ALIS_APP_ID}api-LambdaRole | grep Arn | tr -d ' ",'`

sed -i -e "s?arn:aws:iam::012345678901:role/hogeapi-LambdaRole-XXXXXXXXXXXXX?${LAMBDA_ROLE_ARN}?g" template.yaml
