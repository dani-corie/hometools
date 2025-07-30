# Home toos - Utilities

These are scripts to be installed in ~/bin for everyday use.

## clear-zfs-snapshots

Remove zfs snapshots based on a wildcard string

## deb-backport

Do a simple naive backport of a .deb source package to current distro.

## ibus-reset

Hotfix if gtk / gnome apps don't accept input inside a network namespace

## mnt-ecrypt

Mount an encrypted folder via ecrypt.

## mnt-zfscrypt

Mount an encrypted, non-automounted (OS mtab mount) ZFS filesystem.

## pdf-foldablezine

Turn an 8-page pdf booklet into a single foldable page.

## sshfwd

Quick shortcut to connect ssh and forward remote ports to corresponding local ports. Useful for accessing databases and local services on remote servers.

## with-nm-resolver

I usually don't let NetworkManager manage my resolv.conf, and use encrypted global DNS settings instead. Sometimes you need access to local name resolution though, for intranet names and captive portals. This script uses fs namespaces to run a process with the systemd resolv.conf.

