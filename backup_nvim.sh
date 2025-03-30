#!/bin/bash

# copy custom plugins
SRC="$HOME/.config/nvim/lua/custom/plugins"
DEST="$PWD/nvim_backup/custom_plugins"

mkdir -p "$DEST"
cp -r "$SRC"/* "$DEST"/
echo "Custom Plugins copied"

# copy kickstart plugins

SRC="$HOME/.config/nvim/lua/kickstart/plugins"
DEST="$PWD/nvim_backup/kickstart_plugins"

mkdir -p "$DEST"
cp -r "$SRC"/* "$DEST"/
echo "Kickstart Plugins copied"

# copy init.lua
SRC="$HOME/.config/nvim/init.lua"
DEST="$PWD/nvim_backup/"

cp "$SRC" "$DEST"
echo "init.lua copied"

