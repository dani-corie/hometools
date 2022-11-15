# Home tools

## sshfwd

Quick shortcut to connect ssh and forward remote ports to corresponding local ports. Useful for accessing databases and local services on remote servers.

## with_nm_resolver

I usually don't let NetworkManager manage my resolv.conf, and use encrypted global DNS settings instead. Sometimes you need access to local name resolution though, for intranet names and captive portals. This script uses fs namespaces to run a process with the systemd resolv.conf.

