#!/bin/bash
# This script uses the tool vopono ( https://github.com/jamesmcm/vopono )

vopono exec "${HOME}/bin/.dnscrypt_container bash ${1}" --dns 127.0.0.16 --provider mullvad --server ${1}
