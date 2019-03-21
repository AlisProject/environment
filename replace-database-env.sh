#!/usr/bin/env bash
set -eu

aws dynamodb list-tables |grep ${ALIS_APP_ID}database |sort |tr -d ' ",' | node ./scripts/dynamodb-table-replacer.js
#aws iam list-roles | grep ${ALIS_APP_ID}api-LambdaRole | grep Arn | tr -d ' ",' | node ./scripts/basic-replacer.js 'arn:aws:iam::012345678901:role/hogeapi-LambdaRole-XXXXXXXXXXXXX'
#aws es describe-elasticsearch-domain --domain-name ${ALIS_APP_ID}api | jq '.DomainStatus.Endpoint' | node ./scripts/basic-replacer.js 'search-hogeapi-xxxxxxxxxxxxxxxxxxxxxxxxxx.us-east-2.es.amazonaws.com'
