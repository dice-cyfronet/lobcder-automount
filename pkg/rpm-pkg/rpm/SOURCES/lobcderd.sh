#!/bin/sh
#
# lobcderd      Start iptables firewall
#
# chkconfig:    2345 08 92
# description:  Mount and umount LOBCDER
#
# config: /etc/sysconfig/lobcderd
#
### BEGIN INIT INFO
# Provides:          lobcderd
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Mount LOBCDER at boot time
# Description:       Allow to use VPH-Share resource.
### END INIT INFO

# Source function library.
. /etc/init.d/functions

[ -r /etc/sysconfig/lobcderd ] && . /etc/sysconfig/lobcderd