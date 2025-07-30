#!/bin/bash
# This script creates a user folder in /etc/tmp (which should by all means be
# tmpfs), and symlinks the specified directories to that.
# The list of cache folders can contain single entries or comma-separated
# tuples: local folder path,tmpfs folder name

DIRLIST=(
  "$HOME/.cache/BraveSoftware",del
  "$HOME/.cache/chromium-browser",del
  "$HOME/.cache/google-chrome",del
  "$HOME/.cache/mozilla",del
  "$HOME/.var/app/com.brave.Browser/cache",del,flatpak-brave,
  "$HOME/.var/app/com.discordapp.Discord/cache",copy,flatpak-discord-main-cache
  "$HOME/.var/app/com.discordapp.Discord/config/discord/Cache",copy,flatpak-discord-electron-cache
  "$HOME/.var/app/com.discordapp.Discord/config/discord/Code Cache",copy,flatpak-discord-code-cache
  "$HOME/.var/app/com.discordapp.Discord/config/discord/component_crx_cache",del,flatpak-discord-electron-component_crx_cache
  "$HOME/.var/app/com.discordapp.Discord/config/discord/DawnGraphiteCache",copy,flatpak-discord-electron-DawnGraphiteCache
  "$HOME/.var/app/com.discordapp.Discord/config/discord/DawnWebGPUCache",copy,flatpak-discord-electron-DawnWebGPUCache
  "$HOME/.var/app/com.discordapp.Discord/config/discord/GPUCache",copy,flatpak-discord-electron-GPUCache
)

tmpdir="/tmp/$USER-cache"

mkdir -pm 700 "$tmpdir"

for folder in "${DIRLIST[@]}"
do
  IFS=$','
  set $folder
  if [[ -L "$1" || -e "$1" ]]; then
    if [ -z "$3" ]; then
      tmpfolder="$tmpdir/$(basename "$1")"
    else
      tmpfolder="$tmpdir/$3"
    fi
    mkdir -p "$tmpfolder"

    if [ "$2" == "copy" ]; then
      if [ -L "$1" ]; then
        echo "ignoring entry $1: copy mode specified, but original is a symlink"
      else
        cp -a "$1/." "$tmpfolder/"
        bindfs -o nonempty --no-allow-other "$tmpfolder" "$1"
      fi
    elif [ $2 == "del" ]; then
      rm -rf "$1"
      ln -sf "$tmpfolder" "$1"
    else
      echo "ignoring entry $1: please specify copy or del"
    fi
  fi
  unset IFS
done
