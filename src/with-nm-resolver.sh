#!/bin/bash
## usage: with-nm-resolver {command}
resolv_conf="/run/systemd/resolve/stub-resolv.conf"

script=""
add_cmd() {
  local cmd_str
  printf -v cmd_str '%q ' "$@"
  script+="$cmd_str"$'\n'
}

[[ -e $resolv_conf ]] || { echo "No file found at: $resolv_conf" >&2; exit 1; }

add_cmd mount --bind "$resolv_conf" /etc/resolv.conf
add_cmd sudo -EH -u "$USER" "$@"
sudo -EH unshare --mount sh -e -c "$script"