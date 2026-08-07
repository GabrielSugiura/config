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
  mkdir /etc/kernel/postinst.d
  mv etc/90-grub /etc/kernel/postinst.d
  mv etc/display-manager /etc/conf.d
  mv etc/* /etc
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
  echo "Please execute the script as root"
  echo "Quitting..."
  exit 1
fi

mkdir /home/gabriel/Imagens /home/gabriel/.config
mv Wallpapers /home/gabriel/Imagens
mv config/* /home/gabriel/.config

chown -R gabriel:gabriel /home/gabriel

echo "---------------------------------------"
echo "Configuration Installed"
echo "Deleting this folder"
echo "---------------------------------------"

#cd && rm -rf config
exit
