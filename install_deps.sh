#!/bin/bash

# Copyright (c) 2018 Tim Perkins

set -o errexit
set -o nounset
set -o pipefail

BUILD_DEPS=("rsync" "gcc-avr" "avr-libc")
FLASH_DEPS=("teensy-loader-cli")

if [ -z "$(command -v lsb_release)" ] \
        || lsb_release -is | grep -Eqv "Ubuntu|Linuxmint"; then
    echo "ERROR: Only Ubuntu is supported" >&2
    exit 1
fi

sudo apt-get update
sudo apt-get install -y "${BUILD_DEPS[@]}" "${FLASH_DEPS[@]}"

exit 0
