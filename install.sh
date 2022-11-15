#!/bin/bash
IFS=$'\n'

mkdir -p "$HOME/bin"

for tool in $(find ./src -name '*.sh')
do
  linkname="$HOME/bin/$(basename $tool .sh)"
  echo "Creating symlink $linkname"
  ln -rs $tool $linkname
done

echo "Make sure to add $HOME/bin to PATH"
