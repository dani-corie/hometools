#!/bin/bash

mkdir -p "$HOME/bin"

install_command () {
  linkname="$HOME/bin/$(basename $1 .sh)"
  echo "Creating symlink $linkname"
  ln -rsf $1 $linkname
}

install_internal () {
  linkname="$HOME/bin/.$(basename $1 .sh)"
  echo "Creating symlink $linkname"
  ln -rsf $1 $linkname
}
