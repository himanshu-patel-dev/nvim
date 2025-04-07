#!/bin/bash

# restore custom plugins
DEST="$HOME/.config/nvim/lua/custom/plugins"
SRC="$PWD/nvim_backup/custom_plugins"

mkdir -p "$DEST"
cp -r "$SRC"/* "$DEST"/
echo "Custom Plugins Restored"

# restore kickstart plugins

DEST="$HOME/.config/nvim/lua/kickstart/plugins"
SRC="$PWD/nvim_backup/kickstart_plugins"

mkdir -p "$DEST"
cp -r "$SRC"/* "$DEST"/
echo "Kickstart Plugins Restored"

# copy init.lua
DEST="$HOME/.config/nvim/init.lua"
SRC="$PWD/nvim_backup/init.lua"

cp "$SRC" "$DEST"
echo "init.lua restored"

