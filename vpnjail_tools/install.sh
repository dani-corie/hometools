#!/bin/bash

. "../install_helper.sh"

install_command "vpnbash.sh"
install_internal "dnscrypt_container.sh"

echo "Creating $HOME/.vpnjail directory"
mkdir -p "$HOME/.vpnjail"

echo "Copying $HOME/.vpnjail/dnscrypt-proxy.toml for vpn containers"
cp "./dnscrypt-proxy.toml" "$HOME/.vpnjail/dnscrypt-proxy.toml" 
