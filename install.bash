#!/usr/bin/env bash

echo "---------------------------------------"
echo "Installing configurtion"


if (( EUID == 0 )); then
  echo "Executing as root"
  echo "Copying Grub post kernel install configuration to /etc"
  mv 90-grub /etc/kernel/postinst.d
  echo "Copying Gentoo configuration to /etc"
  echo "---------------------------------------"
  echo "Chose a option below:\n"
  printf "(0) Intel CPU Only\n"
  printf "(1) AMD CPU + Nvidia GPU\n: "
  read option
  if (( option == 0 )); then
    rm -rf /etc/portage/*
    mv portage-intel/* /etc/portage
  elif (( option == 1 )); then
    rm -rf /etc/portage/*
    mv portage-amd-nvidia/* /etc/portage
  else
    echo "No valid option chosen, skipping..."
  fi

else
  echo "Executing as non root"
fi

mv Wallpapers ~/Imagens
mv fish foot helix hypr noctalia wofi user-dirs.dirs ~/.config

echo "---------------------------------------"
echo "Configuration Installed"
echo "Deleting this folder"
echo "---------------------------------------"

cd && rm -rf config
exit
