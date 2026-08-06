#!/usr/bin/env bash

echo "---------------------------------------"
echo "Installing configurtion"

echo "Chose a option below:"
printf "(0) Intel CPU Only\n"
printf "(1) AMD CPU + Nvidia GPU\n: "
read -r option
if ((option > 1)); then
  echo "Invalid Option, Stopping Script"
  exit 1
elif ((option < 0)); then
  echo "Invalid Option, Stopping Script"
  exit 1
fi

if (( EUID == 0 )); then
  echo "Executing as root"
  echo "Copying Grub post kernel install configuration to /etc"
  mv 90-grub /etc/kernel/postinst.d
  mv bluetooth display-manager /etc/conf.d
  mv cmdline greetd /etc
  useradd -m -G users,wheel,audio,video -s /bin/bash gabriel
  passwd gabriel
  echo "Copying Gentoo configuration to /etc"
  echo "---------------------------------------"
  if (( option == 0 )); then
    rm -rf /etc/portage/*
    mv portage-intel/* /etc/portage
    
  elif (( option == 1 )); then
    rm -rf /etc/portage/*
    mv portage-amd-nvidia/* /etc/portage
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

#cd && rm -rf config
exit
