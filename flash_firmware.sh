#!/bin/bash

# Copyright (c) 2018 Tim Perkins

set -o errexit
set -o nounset
set -o pipefail

ERGODOX_EZ_FIRMWARE="build/ergodox_ez_tprk77.hex"

if ! command -v teensy_loader_cli &>/dev/null; then
    echo "Missing teensy_loader_cli! See also:"
    echo "https://www.pjrc.com/teensy/loader_cli.html"
    exit 1
fi

teensy_loader_cli -mmcu=atmega32u4 -v "${ERGODOX_EZ_FIRMWARE}"

exit 0
