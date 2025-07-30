#!/bin/bash

PRIVATE_FOLDER=${1}

sudo mount -t ecryptfs ${PRIVATE_FOLDER} ${PRIVATE_FOLDER} -o no_sig_cache,ecryptfs_enable_filename_crypto=y,ecryptfs_passthrough=n,ecryptfs_key_bytes=16,ecryptfs_cipher=aes
