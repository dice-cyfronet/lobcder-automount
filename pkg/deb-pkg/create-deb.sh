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
    lobcderd /etc/init.d

File: postinst
    #!/bin/sh
    update-rc.d lobcderd defaults

File: postrm
    #!/bin/sh
    update-rc.d -f lobcderd remove

Description: Automount LOBCDER VPH-Share resource
 Provide automount scripts to mount LOBCDER resource via davfs." | cat > lobcderd.spec

equivs-build lobcderd.spec
lintian lobcderd*.deb
