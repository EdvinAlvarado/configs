#!/usr/bin/env bash

if ! command -v flatpak &>/dev/null; then
	echo "flatpak is not installed. Please install flatpak first."
	exit 1
fi

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak update

flatpak -y install com.discordapp.Discord flatseal org.geogebra.GeoGebra komikku monero org.signal.Signal thinkorswim app.zen_browser.zen
# Games
flatpak -y install com.valvesoftware.Steam lutris com.mojang.Minecraft TinyWiiBackupManager ca.wiilink.Patcher Heroic
