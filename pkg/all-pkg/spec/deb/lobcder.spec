Section: misc
Priority: optional
Package: lobcder
Version: 0.0.4
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
 update-rc.d lobcder defaults || systemctl enable lobcder || true
 service lobcder start || true

File: prerm
 #!/bin/sh -e
 service lobcder stop || true

File: postrm
 #!/bin/sh -e
 update-rc.d -f lobcder remove || systemctl disable lobcder || true

Description: Automount LOBCDER VPH-Share resource
 Provide automount scripts to mount LOBCDER resource via davfs.
