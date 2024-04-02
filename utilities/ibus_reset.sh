#!/bin/bash

IBUS_DIR="${HOME}/.config/ibus/bus"

echo "Clearing stale files from $IBUS_DIR"
rm "$IBUS_DIR/*"
