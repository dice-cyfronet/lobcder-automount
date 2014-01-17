#!/bin/sh

echo "Section: misc
Priority: optional
Standards-Version: 3.9.2
Package: lobcderd
Version: 0.1
Maintainer: Pawel Suder <pawel@suder.info>
Depends: davfs2
Architecture: all
Files: lobcderd.conf /etc/default
    lobcderd.sh /etc/init.d
File: postinst
    #!/bin/sh
    /usr/sbin/update-rc.d lobcderd.sh defaults

File: postrm
    #!/bin/sh
    /usr/sbin/update-rc.d -f lobcderd.sh remove

Description: Manage LOBCDER VPH-Share resource
 Manage LOBCDER VPH-Share resource." | cat > lobcderd

equivs-build lobcderd
lintian *.deb
