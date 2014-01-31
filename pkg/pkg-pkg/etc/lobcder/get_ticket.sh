#!/bin/sh

export LOBCDER_USER_DATA_URL=http://169.254.169.254/openstack/latest/user_data

[ -r /etc/lobcder/lobcder.conf ] && . /etc/lobcder/lobcder.conf

get_ticket()
{
    echo `curl --insecure ${LOBCDER_USER_DATA_URL} 2>/dev/null`
}
