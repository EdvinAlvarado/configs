#!/usr/bin/env bash

if ! command -v flatpak &>/dev/null; then
	echo "flatpak is not installed. Please install flatpak first."
	exit 1
fi

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpakl update
