#!/bin/bash
#
# All CF_* variables are provided externally from this script

set -e

# copy the artifact to the task-output folder
cp release/$CF_ARTIFACT_ID-*.tar.gz prepare-manifest-output/.

pushd prepare-manifest-output

ARTIFACT_PATH=$(ls $CF_ARTIFACT_ID-*.tar.gz)
echo "########### $ARTIFACT_PATH #############"
echo "########### $CF_APP_HOST-$CF_SPACE #############"

tar -xzvf $ARTIFACT_PATH 

cat <<EOF >manifest.yml
---
applications:
- name: $CF_APP_NAME
  host: $CF_APP_HOST-$CF_SPACE
  path: $CF_APP_PATH
  memory: 256M
  instances: $CF_INSTANCES
  timeout: 180
  services: [ $CF_APP_SERVICES ]
  buildpack: $CF_BUILDPACK
  env:
    BP_DEBUG: "True"
EOF

cat manifest.yml

popd
