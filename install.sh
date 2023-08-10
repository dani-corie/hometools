#!/bin/bash
IFS=$'\n'

. "./install_helper.sh"

mkdir -p "$HOME/bin"

for tool in $(find ./utilities -name '*.sh')
do
  install_command $tool
done

for tool in $(find ./startup -name '*.sh')
do
  install_internal $tool
done

echo "Make sure to add $HOME/bin to PATH"
