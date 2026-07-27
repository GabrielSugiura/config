#! /usr/bin/bash

echo "---------------------------------------\n"
echo "Installing configurtion"


if ( EOID == 1); then
  echo "Executing as root"
  echo "Copying Gentoo configuration to /etc"
  echo "---------------------------------------\n"
  echo "Chose a option below:\n"
  echo "(0) Intel CPU Only"
  echo "(1) AMD CPU + Nvidia GPU\n: "
  read option
  if ( $option == 0); then
    rm -rf /etc/portage/*
    mv intel-portage/* /etc/portage
  elif ( $option == 1 ); then
    rm -rf /etc/portage/*
    mv amd-nvidia-portage/* /etc/portage
  else
    echo "No valid option chosen, skipping..."
  fi

else
  echo "Executing as non root"
fi

mv Wallpapers ~/Imagens
mv fish foot helix hypr noctalia wofi user-dirs.dirs ~/.config

echo "---------------------------------------\n"
echo "Configuration Installed"
echo "Deleting this folder"
echo "---------------------------------------\n"

cd && rm -rf config
exit
