#! /usr/bin/env bash

echo "---------------------------------------"

if (( EUID == 0 )); then
  echo "Running as root"
  echo "Executing Post Gentoo Installation Script"
else
  echo "Running as non root"
  echo "Aborting..."
  echo "---------------------------------------"
  exit 1
fi

mv etc/90-grub /etc/kernel/postinst.d

emerge xdg-desktop-portal-hyprland xdg-desktop-portal-gtk
emerge waterfox-bin thunar thunar-volman tumbler ffmpegthumbnailer
emerge gentoolkit eclean-kernel zstandard eselect-repository
emerge dev-lang/rust dev-lang/gnucobol app-editors/helix app-shells/fish
emerge display-manager-init tuigreet power-profiles-daemon
rc-update add display-manager
rc-update add power-profiles-daemon
emerge gui-apps/wofi app-misc/ranger discord spotify mupdf foot

echo "Post Install Finished!"
echo "---------------------------------------"
