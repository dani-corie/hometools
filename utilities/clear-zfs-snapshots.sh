#!/bin/bash
# A simple tool for removing all zfs snapshots that match a regex.
# Very useful for clearing auto snapshots. For safety purposes, this script
# does not run the 'zfs destroy' commands, instead outputting them to stdout to
# be saved, inspected and called with sudo.
# usage: sudo remove-zfs-snapshots {regex} > delete.sh
IFS=$'\n'

echo '#!/bin/bash'
echo '[[ $EUID = 0 ]] || { echo "Must be run as root" >&2; exit 1; }'
for snapshot in $(zfs list -H -o name -t snapshot | grep -e "^$@\$")
do
  echo zfs destroy -v \'"$snapshot"\'
done