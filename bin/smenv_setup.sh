#!/bin/bash
AUTOTESTS_ENV="beta"
WORKSPACE="/Users/elee/src/savvymoney/savvymoney-automation-tests/target"
AWS_REGION="us-east-1"
S3BUCKET="${AUTOTESTS_ENV}-sm-ui-autotests"
AGGREGATE_REPORT_FOLDER="${WORKSPACE}/target/report"
SERENITY_REPORT_URL="http://${S3BUCKET}.s3-website-us-east-1.amazonaws.com/${UNIQUE_ID}/"
SESSIONS_REPORTS_FOLDER="${WORKSPACE}/${UNIQUE_ID}"

printf "done\n"
