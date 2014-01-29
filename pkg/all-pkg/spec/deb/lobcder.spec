Section: misc
Priority: optional
Package: lobcder
Version: 0.0.2
Maintainer: Pawel Suder <pawel@suder.info>
Depends: davfs2, curl
Architecture: all
Files: ./lobcder /etc/init.d
 ./lobcder.conf /etc/lobcder
 ./get_ticket.sh /etc/lobcder
 ./parse_ticket.sh /etc/lobcder
 ./short_token.sh /etc/lobcder

File: postinst
 #!/bin/sh -e
 update-rc.d lobcder defaults
 service lobcder start

File: prerm
 #!/bin/sh -e
 service lobcder stop

File: postrm
 #!/bin/sh -e
 update-rc.d -f lobcder remove

Description: Automount LOBCDER VPH-Share resource
 Provide automount scripts to mount LOBCDER resource via davfs.
