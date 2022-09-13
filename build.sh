#!/bin/bash
# based on the instructions from edk2-platform
set -e
. build_common.sh
# not actually GCC5; it's GCC7 on Ubuntu 18.04.
GCC5_ARM_PREFIX=arm-linux-gnueabihf- build -s -n 0 -a ARM -t GCC5 -p MSM8916Pkg/Devices/j5lte.dsc
gzip -c < workspace/Build/MSM8916Pkg/DEBUG_GCC5/FV/MSM8916PKG_UEFI.fd >uefi.img
cat device_specific/MT6580.dtb >>uefi.img
