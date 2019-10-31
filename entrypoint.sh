#!/bin/sh


if [[ -z $AWS_ACCESS_KEY_ID ]]; then
  echo "AWS_ACCESS_KEY_ID env variable needs to be defined"
  exit
fi

if [[ -z $AWS_SECRET_ACCESS_KEY ]]; then
  echo "AWS_SECRET_ACCESS_KEY env variable needs to be defined"
  exit
fi

if [[ -z $S3_BUCKET ]]; then
  echo "S3_BUCKET env variable needs to be defined"
  exit
fi

if [ -z "$(ls -A /mnt/s3)" ]; then
    echo "Copying bucket from S3 to volume mounted at /mnt/s3"
    aws s3 cp --recursive $S3_BUCKET /mnt/s3
else
    echo "Folder contains data, not downloading from S3"
    exit
fi
