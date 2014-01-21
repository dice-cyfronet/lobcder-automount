#!/bin/sh

export LOBCDER_SHORT_TOKEN_URL=http://149.156.10.138:8080/lobcder/urest/getshort

short_token()
{
    echo `curl ${LOBCDER_SHORT_TOKEN_URL}/$1 2>/dev/null`
}
