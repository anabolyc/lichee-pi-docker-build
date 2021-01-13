#!/bin/sh
BOARD_DIR="$( dirname "${0}" )"
MKIMAGE="${HOST_DIR}/bin/mkimage"
MKSWAP="${HOST_DIR}/sbin/mkswap"
BOOT_CMD="${BOARD_DIR}/boot.cmd"
BOOT_CMD_H="${BINARIES_DIR}/boot.scr"

# Config ssh keys

chmod 600 "${TARGET_DIR}/root/.ssh/authorized_keys"
