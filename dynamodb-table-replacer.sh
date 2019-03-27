#!/usr/bin/env bash
set -eu

# DynamoDB
aws dynamodb list-tables |grep ${ALIS_APP_ID}database |sort |tr -d ' ",' | node ./scripts/dynamodb-table-replacer.js

# TODO:
# Cognito
#aws cognito-identity list-identity-pools --max-results 5 | \
#  jq --arg USER_POOL_NAME \
#  "${ALIS_APP_ID}cognito" '.IdentityPools[] | select(.IdentityPoolName == $USER_POOL_NAME) | .IdentityPoolId' | \
#  aws cognito-identity --identity-pool-id
#
#
#aws iam list-roles | grep ${ALIS_APP_ID}api-LambdaRole | grep Arn | tr -d ' ",' | node ./scripts/basic-replacer.js 'arn:aws:iam::012345678901:role/hogeapi-LambdaRole-XXXXXXXXXXXXX'
#aws es describe-elasticsearch-domain --domain-name ${ALIS_APP_ID}api | jq '.DomainStatus.Endpoint' | node ./scripts/basic-replacer.js 'search-hogeapi-xxxxxxxxxxxxxxxxxxxxxxxxxx.us-east-2.es.amazonaws.com'
