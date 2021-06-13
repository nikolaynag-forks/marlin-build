#!/bin/bash
set -eu
BOARD="STM32F103RC_btt_512K"
marlin_dir="$(readlink -f "$1")"
target="$2"
image_hash="$(docker build -q .)"
docker run -it --rm -v "$marlin_dir":/home/platformio/Marlin "$image_hash" /bin/bash -c 'cd Marlin; platformio run'
mv "$marlin_dir/.pio/build/$BOARD/firmware.bin" "$target"
