Section: misc
Priority: optional
Package: lobcderd
Version: 0.0.1
Maintainer: Pawel Suder <pawel@suder.info>
Depends: davfs2
Architecture: all
Files: lobcderd.conf /etc/default
    lobcderd /etc/init.d
    parse_ticket.sh /etc/lobcderd

File: postinst
    #!/bin/sh
    update-rc.d lobcderd defaults

File: postrm
    #!/bin/sh
    update-rc.d -f lobcderd remove

Description: Automount LOBCDER VPH-Share resource
 Provide automount scripts to mount LOBCDER resource via davfs.
