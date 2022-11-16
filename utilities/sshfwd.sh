#!/bin/bash
# A shortcut to connect ssh with port forwarding
# usage: sshfwd [user@]{server} {ports to be forwarded}
# eg. sshfwd myuser@example.com 5432 8001

call="ssh $1"; shift

add_port() {
  local param=" -L$1:localhost:$1"
  call+="$param"
}

for port in "$@"
do
  add_port "$port"
done

exec $call