#!/bin/sh

# mount-lobcder.sh

# Options:
#   -h, --help
#   -l, --lobcder-url
#   -m, --mount-point
#   -u, --username
#   -p, --password


export LOBCDER_URL=http://149.156.10.138:8080/lobcder/dav
export LOBCDER_DIR=/media/lobcder

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
            echo "-l, --lobcder-url=URL     LOBCDER URL (default: http://149.156.10.138:8080/lobcder/dav)"
            echo "-m, --mount-point=DIR     mount point (default: /media/lobcder)"
            echo "-u, --username=USER       LOBCDER username"
            echo "-p, --password=PASS       LOBCDER token"
            exit 0
            ;;
        -l)
            shift
            if test $# -gt 0; then
                export LOBCDER_URL=$1
            else
                echo "no LOBCDER URL specified"
                exit 1
            fi
            shift
            ;;
        --lobcder-url*)
            export LOBCDER_URL=`echo $1 | sed -e 's/^[^=]*=//g'`
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
            export LOBCDER_DIR=`echo $1 | sed -e 's/^[^=]*=//g'`
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
            export LOBCDER_USER=`echo $1 | sed -e 's/^[^=]*=//g'`
            shift
            ;;
        -p)
            shift
            if test $# -gt 0; then
                export LOBCDER_PASS=$1
            else
                echo "no password specified"
                exit 1
            fi
            shift
            ;;
        --password*)
            export LOBCDER_PASS=`echo $1 | sed -e 's/^[^=]*=//g'`
            shift
            ;;
        *)
            break
            ;;
    esac
done

if [ -z "$LOBCDER_USER" ]; then
    echo "no username specified, use -u|--username=USER"
    exit 1
fi

if [ -z "$LOBCDER_PASS" ]; then
    echo "no password specified, use -p|--password=PASS"
    exit 1
fi

if [ ! -d "$LOBCDER_DIR" ]; then
    mkdir -p $LOBCDER_DIR
fi

echo "$LOBCDER_USER
$LOBCDER_PASS
" | mount.davfs $LOBCDER_URL $LOBCDER_DIR


