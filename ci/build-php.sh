#!/bin/bash

set -e

VERSION=`cat version/number`

echo "####### ${ARTIFACT_ID}  #########"
echo "####### ${VERSION}  #########"

pushd project

php -v
wget http://www.phing.info/get/phing-latest.phar
#php phing-latest.phar build.xml

composer install
#SLEEP=60
popd

# give services time to spin up
#echo "waiting for composer to initialize ($SLEEP seconds)"
#sleep $SLEEP

echo "before tar"
tar -czvf $ARTIFACT_ID-$VERSION.tar.gz ./project &>/dev/null
mv $ARTIFACT_ID-$VERSION.tar.gz ./build-output
echo "after tar"

echo "done"
