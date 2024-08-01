#/bin/sh
ADDOK_DIRECTORY=addok

cd /data/
wget ${ADDOK_FRANCE_BUNDLE_URL} -O addok-france-bundle.zip

mkdir ${ADDOK_DIRECTORY}

unzip addok-france-bundle.zip -d ${ADDOK_DIRECTORY}

aws ${AWS_OPTS} --endpoint-url ${S3_ENDPOINT_URL} s3 cp --recursive ${ADDOK_DIRECTORY}/ ${S3_BUCKET}

