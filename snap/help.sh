#!/bin/sh
# Exposed as minimal-go-snap.help

set -e

snap_name="minimal-go-snap"

echo "${snap_name} snap help:\n"
echo "\\033[4mThese configuration options need to be set:\\033[24m\n"
echo " - bind-addr (currently: $(snapctl get bind-addr))"
