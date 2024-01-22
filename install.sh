#!/bin/bash

if [ ! -e /etc/arch-release ]; then
	echo "This script only works on Arch Linux"
	echo "If you still want to use the configs, run 'stow ./stow/\*/'"
	exit 1
fi

mkdir ./tmp

sudo pacman -S --needed git base-devel pacman-contrib

# Install AME AUR helper if rust is installed
cd tmp
if command -v rustup &> /dev/null; then
	echo "found rustup, installing ame"
	git clone https://git.getcryt.al/crystal/pkgbuilds/ame
	cd ame && makepkg -si && cd ..
else
	echo "rustup is not installed, not installing ame"
fi

echo "installing yay"
git clone https://aur.archlinux.org/yay-git.git
cd yay-git && makepkg -si && cd ..

cd ..
