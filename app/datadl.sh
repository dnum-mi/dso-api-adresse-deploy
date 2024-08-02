#!/bin/sh
## Download data from S3 to specific volume

mkdir -p ${VOLDATA}

aws ${AWS_OPTS} --endpoint-url ${S3_ENDPOINT_URL} s3 cp ${S3_BUCKET}/${S3_FILE} ${VOLDATA}/${S3_FILE}

