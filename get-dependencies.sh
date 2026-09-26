#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
#pacman -Syu --noconfirm tmux

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano

# Comment this out if you need an AUR package
#make-aur-package PACKAGENAME

# If the application needs to be manually built that has to be done down here
wget -O ./PKGBUILD "https://gitea.artixlinux.org/packages/tmux/raw/branch/master/PKGBUILD"
makepkg -si
