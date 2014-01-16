#!/bin/sh

export LOBCDER_URL=http://149.156.10.138:8080/lobcder/dav
export LOBCDER_DIR=/media/lobcder

get_param() {
    return `echo $1 | sed -e 's/^[^=]*=//g'`
}

if which mount.davfs >/dev/null; then
    echo -n ''
else
    echo 'mount.davfs is not installed'
    exit 1
fi

while test $# -gt 0; do
    case "$1" in
        -h|--help)
            echo "options:"
            echo "-h, --help                show this help"
            echo "-l, --lobcder-url=URL     LOBCDER url (default: http://149.156.10.138:8080/lobcder/dav)"
            echo "-m, --mount-point=DIR     mount point (default: /media/lobcder)"
            echo "-u, --username=USER       username"
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
        -m)
            shift
            if test $# -gt 0; then
                export LOBCDER_DIR=$1
            else
                echo "no mount point specified"
                exit 1
            fi
            shift
            ;;
        --mount-point*)
            export LOBCDER_DIR=`get_param $1`
            shift
            ;;
        -u)
            shift
            if test $# -gt 0; then
                export LOBCDER_USER=$1
            else
                echo "no username specified"
                exit 1
            fi
            shift
            ;;
        --username*)
            export LOBCDER_USER=`get_param $1`
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

if [ -z "${LOBCDER_USER}" ]; then
    echo "no user specified, use -u|--username=USER"
    exit 1
fi

if [ -z "${LOBCDER_TOKEN}" ]; then
    echo "no token specified, use -t|--token=TOKEN"
    exit 1
fi

if [ ! -d "${LOBCDER_DIR}" ]; then
    mkdir -p ${LOBCDER_DIR}
fi

echo "$LOBCDER_USER
$LOBCDER_TOKEN
" | mount.davfs ${LOBCDER_URL} ${LOBCDER_DIR}
