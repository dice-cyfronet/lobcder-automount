#!/bin/sh

export LOBCDER_SHORT_TOKEN_URL=https://lobcder.vph.cyfronet.pl/lobcder/urest/getshort

[ -r /etc/lobcder/lobcder.conf ] && . /etc/lobcder/lobcder.conf

short_token()
{
    echo `curl --insecure ${LOBCDER_SHORT_TOKEN_URL}/$1 2>/dev/null`
}
