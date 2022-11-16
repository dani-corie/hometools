# Home toos - Utilities

These are scripts to be installed in ~/bin for everyday use.

## remove-zfs-snapshots

A script for clearing up zfs snapshots... In complex filesystems, such as the default zfs installation of Ubuntu 22.04, it's easy to get swamped by automatically generated snapshots. Here's a tool to take out the trash at will.

## sshfwd

Quick shortcut to connect ssh and forward remote ports to corresponding local ports. Useful for accessing databases and local services on remote servers.

## with-nm-resolver

I usually don't let NetworkManager manage my resolv.conf, and use encrypted global DNS settings instead. Sometimes you need access to local name resolution though, for intranet names and captive portals. This script uses fs namespaces to run a process with the systemd resolv.conf.

