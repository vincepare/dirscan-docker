#!/usr/bin/env sh

export DIRSCAN_CHROOT='/hostfs'
exec dirscan "$@"
