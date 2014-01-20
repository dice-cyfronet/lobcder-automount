#!/bin/sh

# wget ftp://ftp.pbone.net/mirror/ftp5.gwdg.de/pub/opensuse/repositories/home:/sawaa/CentOS_CentOS-6/x86_64/davfs2-1.4.7-0.2.el6.1.x86_64.rpm
# EPEL

tar zcvf lobcderd-0.0.1.tar.gz ./lobcderd-0.0.1/

yum install rpmdevtools
useradd pkg

su pkg -c 'rpmdev-setuptree'

cp lobcderd-0.0.1.tar.gz /home/pkg/rpmbuild/SOURCES
cp lobcderd.spec /home/pkg/rpmbuild/SPECS
chown -R pkg:pkg /home/pkg

su pkg -c 'cd /home/pkg/rpmbuild && rpmbuild -ba SPECS/lobcderd.spec'
cp /home/pkg/rpmbuild/RPMS/noarch/lobcderd-0.0.1-1.noarch.rpm ./

rm -rf /home/pkg/rpmbuild