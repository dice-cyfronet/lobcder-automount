#!/bin/sh

export LOBCDER_URL=http://149.156.10.138:8080/lobcder/urest/getshort

get_param() {
    return `echo $1 | sed -e 's/^[^=]*=//g'`
}

if which curl >/dev/null; then
    echo -n ''
else
    echo 'curl is not installed'
    exit 1
fi

while test $# -gt 0; do
    case "$1" in
        -h|--help)
            echo "options:"
            echo "-h, --help                show this help"
            echo "-l, --lobcder-url=URL     LOBCDER url (default: http://149.156.10.138:8080/lobcder/urest/getshort)"
            echo "-t, --token=TOKEN         token"
            exit 0
            ;;
        -l)
            shift
            if test $# -gt 0; then
                export LOBCDER_URL=$1
            else
                echo "no LOBCDER url specified"
                exit 1
            fi
            shift
            ;;
        --lobcder-url*)
            export LOBCDER_URL=`get_param $1`
            shift
            ;;
        -t)
            shift
            if test $# -gt 0; then
                export LOBCDER_TOKEN=$1
            else
                echo "no token specified"
                exit 1
            fi
            shift
            ;;
        --token*)
            export LOBCDER_TOKEN=`get_param $1`
            shift
            ;;
        *)
            break
            ;;
    esac
done

if [ -z "${LOBCDER_TOKEN}" ]; then
    echo "no token specified, use -t|--token=TOKEN"
    exit 1
fi

curl ${LOBCDER_URL}/${LOBCDER_TOKEN}
