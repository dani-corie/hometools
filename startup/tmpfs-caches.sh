#!/bin/bash
# This script creates a user folder in /etc/tmp (which should by all means be
# tmpfs), and symlinks the specified directories to that.
# The list of cache folders can contain single entries or comma-separated
# tuples: local folder path,tmpfs folder name

DIRLIST=(
  "$HOME/.cache/BraveSoftware"
  "$HOME/.cache/chromium-browser"
  "$HOME/.cache/google-chrome"
  "$HOME/.cache/mozilla"
  "$HOME/.var/app/com.discordapp.Discord/config/discord/Cache",discord-cache
  "$HOME/.var/app/com.discordapp.Discord/config/discord/Code Cache",discord-code-cache
)

tmpdir="/tmp/$USER-cache"

mkdir -pm 700 "$tmpdir"

for folder in "${DIRLIST[@]}"
do
  IFS=$','
  set $folder
  if [[ -L "$1" || -e "$1" ]]; then
    if [ -z "$2" ]; then
      tmpfolder="$tmpdir/$(basename "$1")"
    else
      tmpfolder="$tmpdir/$2"
    fi
    mkdir -p "$tmpfolder"
    rm -rf "$1"
    ln -sf "$tmpfolder" "$1"
  fi
  unset IFS
done