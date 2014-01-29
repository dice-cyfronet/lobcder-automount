#!/bin/bash

export CURRENT_DIR=`pwd`
export TEMP_DIR=`mktemp -d`

mkdir -p ${TEMP_DIR}/etc/lobcder
mkdir -p ${TEMP_DIR}/usr/sbin
mkdir -p ${TEMP_DIR}/usr/lib/systemd/system

cp ./spec/pkg/PKGINFO ${TEMP_DIR}/.PKGINFO
cp ./spec/pkg/INSTALL ${TEMP_DIR}/.INSTALL

cp -r ./src/conf/* ${TEMP_DIR}/etc/lobcder
cp -r ./src/service/pkg/lobcder ${TEMP_DIR}/usr/sbin
cp -r ./src/service/pkg/lobcder.service ${TEMP_DIR}/usr/lib/systemd/system

cd ${TEMP_DIR}
tar -cf - .PKGINFO .INSTALL * | xz -c -z - > ${CURRENT_DIR}/pkg/lobcder.pkg.tar.xz

cd ${CURRENT_DIR}
rm -rf ${TEMP_DIR}
