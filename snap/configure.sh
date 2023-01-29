#!/bin/sh
# Configure hook script for snap

set -e

# Just initializes config values so that they are easier to discover with `snap get`.

if [ -z "$(snapctl get bind-addr)" ]; then
  snapctl set bind-addr=":8080"
fi
