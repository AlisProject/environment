#!/usr/bin/env bash
set -eu

# Rest API
API_ID=`aws apigateway get-rest-apis | jq -r --arg API_NAME "${ALIS_APP_ID}api" '.items[] | select(.name == $API_NAME) | .id'`
ACCOUNT=`aws sts get-caller-identity | jq -r '.Account'`

END_OF_REST_API_ARN=${ACCOUNT}:${API_ID}


sed -i -e "s/REPLACE_TO_END_OF_REST_API_ARN/${END_OF_REST_API_ARN}/g" template.yaml
