#!/bin/sh
# https://github.com/3stadt/pandoc-docker

if [ "$#" = 0 ]; then
    exec pandoc --help
fi

case "$1" in
    /bin/*|sh|bash|pandoc)
        exec "$@"
        ;;
    *)
        if [ -f /data/Makefile ]; then
            exec make
        else
            exec pandoc "$@"
        fi
        ;;
esac
