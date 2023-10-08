#!/bin/bash

# Copyright (c) 2018 Tim Perkins

set -o errexit
set -o nounset
set -o pipefail

ERGODOX_EZ_FIRMWARE="build/ergodox_ez_tprk77.hex"

if [ -f "/.dockerenv" ]; then
    echo "ERROR: This is not going to work in a Docker container!" >&2
    exit 1
fi

if ! command -v teensy_loader_cli &>/dev/null; then
    echo "ERROR: Missing teensy_loader_cli!" >&2
    echo "ERROR: See also: https://www.pjrc.com/teensy/loader_cli.html" >&2
    exit 1
fi

teensy_loader_cli -v -mmcu=atmega32u4 -w "${ERGODOX_EZ_FIRMWARE}"

exit 0
