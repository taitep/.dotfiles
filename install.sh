#!/bin/bash

if [ ! -e /etc/arch-release ]; then
	echo "This script only works on Arch Linux"
	echo "If you still want to use the configs, run "stow ./stow/*/"
	exit 1
fi

