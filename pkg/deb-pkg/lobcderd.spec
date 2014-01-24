Section: misc
Priority: optional
Package: lobcderd
Version: 0.0.1
Maintainer: Pawel Suder <pawel@suder.info>
Depends: davfs2, curl
Architecture: all
Files: ./lobcderd /etc/init.d
 ./lobcderd.conf /etc/lobcderd
 ./get_ticket.sh /etc/lobcderd
 ./parse_ticket.sh /etc/lobcderd
 ./short_token.sh /etc/lobcderd

File: postinst
 #!/bin/sh -e
 update-rc.d lobcderd defaults
 service lobcderd start

File: prerm
 #!/bin/sh -e
 service lobcderd stop

File: postrm
 #!/bin/sh -e
 update-rc.d -f lobcderd remove

Description: Automount LOBCDER VPH-Share resource
 Provide automount scripts to mount LOBCDER resource via davfs.
