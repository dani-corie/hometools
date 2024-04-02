#!/bin/bash
# This is a simple script for getting and backporting a debian source package
# (.dsc) to the current OS version.
#

distro_release=$(lsb_release -c)
dsc_uri="$1"
dsc_filename=$(basename "$dsc_uri")

if [ ! -e "$PWD/$dsc_filename" ]; then
  echo "== Downloading and unpacking source package"
  dget "$dsc_uri"
fi

echo "== Installing build dependencies"
sudo apt build-dep "$PWD/$dsc_filename"

cd "$folder"

echo "== Updating changelog"
dch --local "local~$distro_release" --distribution "$distro_release" "No-change backport rebuild for $distro_release"

echo "== Compiling package"
debuild -us -uc -b

cd .. 
