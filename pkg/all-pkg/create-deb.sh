#!/bin/bash

export CURRENT_DIR=`pwd`
export TEMP_DIR=`mktemp -d`

cp src/bin/* ${TEMP_DIR}
cp src/conf/* ${TEMP_DIR}
cp src/service/deb/lobcder ${TEMP_DIR}
cp spec/deb/lobcder.spec ${TEMP_DIR}/lobcder.spec
cd ${TEMP_DIR}

equivs-build lobcder.spec
lintian lobcder*.deb

cp lobcder*.deb ${CURRENT_DIR}/pkg/
cd ${CURRENT_DIR}
rm -rf ${TEMP_DIR}
