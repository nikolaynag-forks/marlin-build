#!/bin/bash
set -eu
marlin_dir="$(readlink -f "$1")"
image_hash="$(docker build -q .)"
docker run -it --rm -v "$marlin_dir":/home/platformio/Marlin "$image_hash"
