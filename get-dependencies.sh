#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
#pacman -Syu --noconfirm tmux
pacman -Syu --noconfirm \
	libevent ncurses libutempter

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano

# Comment this out if you need an AUR package
#make-aur-package PACKAGENAME

# If the application needs to be manually built that has to be done down here
git clone "https://github.com/tmux/tmux" ./tmux
cd ./tmux
git rev-parse --short HEAD > ~/version
sh ./autogen.sh
./configure \
		--prefix=/usr \
		--enable-sixel \
		--disable-systemd \
		--enable-utempter
make
make install
