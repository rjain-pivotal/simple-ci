#!/bin/bash

set -e

# Cleanup temp org and space
# if [ "true" = "$DELETE_SPACE" ]; then
#   cf delete-space $CF_SPACE
# fi
# if [ "true" = "$DELETE_ORG" ]; then
#   cf delete-space -f $CF_ORG
# fi

echo "Installing newman...."
npm install -g newman &>/dev/null

newman run pipeline/postman/PivotalPOC-Maven-APIs.postman_collection.json -e pipeline/postman/Maven.postman_environment.json 2>&1 | tee output.txt

echo "Status code is $?"
if [ $? -ne 0 ]; then
	echo " !!! ERROR !!!" >&2
fi

#exit 1