#!/bin/bash

# free the left super key from oppression
gsettings set org.gnome.mutter overlay-key ''

# caps lock as ctrl
gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:nocaps']"

# sane touchpad behavior
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
gsettings set org.gnome.desktop.peripherals.touchpad tap-and-drag false
gsettings set org.gnome.desktop.peripherals.touchpad click-method 'fingers'

# natural scrolling everywhere
gsettings set org.gnome.desktop.peripherals.mouse natural-scroll true
