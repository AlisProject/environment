#!/usr/bin/env bash
set -eu

# Rest API
API_ID=`aws apigateway get-rest-apis | jq -r --arg API_NAME "${ALIS_APP_ID}api" '.items[] | select(.name == $API_NAME) | .id'`
ACCOUNT=`aws sts get-caller-identity | jq -r '.Account'`

END_OF_REST_API_ARN=${ACCOUNT}:${API_ID}


sed -i -e "s/REPLACE_TO_END_OF_REST_API_ARN/${END_OF_REST_API_ARN}/g" template.yaml


# Rest API
LAMBDA_ROLE_ARN=`aws iam list-roles | grep ${ALIS_APP_ID}api-LambdaRole | grep Arn | awk '{print $2}' | tr -d ' ",'`

sed -i -e "s?arn:aws:iam::012345678901:role/hogeapi-LambdaRole-XXXXXXXXXXXXX?${LAMBDA_ROLE_ARN}?g" template.yaml

# ElasticSearch
ES_END_POINT=`aws es describe-elasticsearch-domain --domain-name ${ALIS_APP_ID}api | jq '.DomainStatus.Endpoint'`

sed -i -e "s?search-hogeapi-xxxxxxxxxxxxxxxxxxxxxxxxxx.us-east-2.es.amazonaws.com?${ES_END_POINT}?g" template.yaml
