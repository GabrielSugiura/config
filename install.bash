#! /usr/bin/bash

echo "Installing configurtion"

mv Wallpapers ~/Imagens
mv fish foot helix hypr noctalia wofi user-dirs.dirs ~/.config

echo "Configuration Installed"
echo "Deleting this folder"

cd && rm -rf config
