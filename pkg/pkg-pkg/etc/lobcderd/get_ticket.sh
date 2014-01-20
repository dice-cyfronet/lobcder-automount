#!/bin/sh

export LOBCDER_USER_DATA_URL=http://169.254.169.254/openstack/latest/user_data

get_ticket()
{
    echo `curl ${LOBCDER_USER_DATA_URL} 2>/dev/null`
}
