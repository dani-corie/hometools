#!/bin/bash
IFS=$'\n'

mkdir -p "$HOME/bin"

for tool in $(find ./utilities -name '*.sh')
do
  linkname="$HOME/bin/$(basename $tool .sh)"
  echo "Creating symlink $linkname"
  ln -rsf $tool $linkname
done

for tool in $(find ./startup -name '*.sh')
do
  linkname="$HOME/bin/.$(basename $tool .sh)"
  echo "Creating symlink $linkname"
  ln -rsf $tool $linkname
done

echo "Make sure to add $HOME/bin to PATH"
