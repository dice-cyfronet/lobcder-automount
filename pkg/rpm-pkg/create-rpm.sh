#!/bin/bash

export VERSION=0.0.2

tar zcvf lobcder-${VERSION}.tar.gz ./lobcder/

yum install rpmdevtools
useradd pkg

su pkg -c 'rpmdev-setuptree'

cp lobcder-${VERSION}.tar.gz /home/pkg/rpmbuild/SOURCES
cp lobcder.spec /home/pkg/rpmbuild/SPECS
chown -R pkg:pkg /home/pkg

su pkg -c 'cd /home/pkg/rpmbuild && rpmbuild -ba SPECS/lobcder.spec'
cp /home/pkg/rpmbuild/RPMS/noarch/lobcder-${VERSION}-1.noarch.rpm ./

rm -rf /home/pkg/rpmbuild