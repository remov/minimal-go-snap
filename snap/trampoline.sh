#!/bin/sh

set -e

export BIND_ADDR="$(snapctl get bind-addr)"
export STATIC_FILES="$SNAP/web-static"

exec "$SNAP/web-server"
