#!/usr/bin/env bash

TIMESTAMP=$(date -v-2H +"%Y%m%d")
export YESTERDAY=`date -v-1w +%F`
#  looking for names like: object-name.20170211000, object-name.20170211200
aws s3api list-objects --bucket "my-bucket-name" --prefix "prefixed/folder" --query "Contents[?starts_with(Key,\`prefixed/folder/object-name.${TIMESTAMP}\`)][].{Key:Key}"
aws s3api list-objects --bucket "my-bucket-name" --prefix "prefixed/folder" --query "Contents[?starts_with(Key,\`prefixed/folder/object-name.${TIMESTAMP}\`)][].Key"


