#!/bin/sh
## Download data from S3 to specific volume

echo "Download data:"
echo "  from: ${S3_ENDPOINT_URL} ${S3_BUCKET}/${S3_FILE}"
echo "  to: ${VOLDATA}/${S3_FILE}"

mkdir -p ${VOLDATA}

echo 'STEP 1/1: downlaod data'

aws ${AWS_OPTS} --endpoint-url ${S3_ENDPOINT_URL} s3 cp ${S3_BUCKET}/${S3_FILE} ${VOLDATA}/${S3_FILE}

if [ $? -ne 0 ]; then
  echo "Impossible de télécharger les fichiers depuis le S3"
  exit 1
fi