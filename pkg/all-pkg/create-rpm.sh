#!/bin/bash

export VERSION=0.0.3

export CURRENT_DIR=`pwd`
export TEMP_DIR=`mktemp -d`
export HOME=${TEMP_DIR}

mkdir -p ${TEMP_DIR}/lobcder-${VERSION}

cp -r ./src/conf/* ${TEMP_DIR}/lobcder-${VERSION}
cp -r ./src/service/rpm/lobcder ${TEMP_DIR}/lobcder-${VERSION}
cp -r ./spec/rpm/lobcder.spec ${TEMP_DIR}/

cd ${HOME}

tar zcvf lobcder-${VERSION}.tar.gz ./lobcder-${VERSION}
rm -rf ./lobcder-${VERSION}/

rpmdev-setuptree

cp lobcder-${VERSION}.tar.gz ${HOME}/rpmbuild/SOURCES
cp lobcder.spec ${HOME}/rpmbuild/SPECS

cd ${HOME}/rpmbuild
rpmbuild -ba SPECS/lobcder.spec

cp ${HOME}/rpmbuild/RPMS/noarch/lobcder-${VERSION}-1.noarch.rpm ${CURRENT_DIR}/pkg/

rm -rf ${TEMP_DIR}
