#!/bin/sh

DEFAULT_MOUNT=/mnt
vault=${1}
mountpoint=${2:-$DEFAULT_MOUNT}

sudo zfs load-key "$vault"
sudo mount -t zfs "$vault" "$mountpoint"
