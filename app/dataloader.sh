#!/bin/sh
## Download data from opendata, unzip and upload to S3

ADDOK_DIRECTORY=addok

echo "Download data:"
echo "  from ${ADDOK_FRANCE_BUNDLE_URL}"
echo "  to ${S3_ENDPOINT_URL} ${S3_BUCKET}"

cd /data/

echo 'STEP 1/3: download data'
wget ${ADDOK_FRANCE_BUNDLE_URL} -O addok-france-bundle.zip

if [ $? -ne 0 ]; then
  echo 'Impossible de récupérer le fichier sur internet'
  exit 1
fi

mkdir ${ADDOK_DIRECTORY}

echo 'STEP 2/3: unzip data'
unzip addok-france-bundle.zip -d ${ADDOK_DIRECTORY}

if [ $? -ne 0 ]; then
  echo "Impossible de dézipper l'archive"
  exit 1
fi

ls -lh ${ADDOK_DIRECTORY}

echo 'STEP 3/3: upload data to S3'
aws ${AWS_OPTS} --endpoint-url ${S3_ENDPOINT_URL} s3 cp --recursive ${ADDOK_DIRECTORY}/ ${S3_BUCKET}

if [ $? -ne 0 ]; then
  echo "Impossible d'uploader les fichiers sur le S3"
  exit 1
fi