Section: misc
Priority: optional
Package: lobcderd
Version: 0.0.1
Maintainer: Pawel Suder <pawel@suder.info>
Depends: davfs2
Architecture: all
Files: lobcderd.conf /etc/default
    lobcderd /etc/init.d
    get_ticket.sh /etc/lobcderd
    parse_ticket.sh /etc/lobcderd

File: postinst
    #!/bin/sh
    update-rc.d lobcderd defaults
    service lobcderd start

File: prerm
    #!/bin/sh
    service lobcderd stop

File: postrm
    #!/bin/sh
    update-rc.d -f lobcderd remove

Description: Automount LOBCDER VPH-Share resource
 Provide automount scripts to mount LOBCDER resource via davfs.
