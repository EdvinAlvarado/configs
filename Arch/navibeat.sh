#!/usr/bin/env bash
curl -fsSL https://dl.navibeat.app/navibeat-repo.asc -o /tmp/navibeat-repo.asc
sudo pacman-key --add /tmp/navibeat-repo.asc
sudo pacman-key --lsign-key 0940E93F0EA97642
sudo tee -a /etc/pacman.conf >/dev/null <<'CONF'

[navibeat]
SigLevel = Required
Server = https://dl.navibeat.app/arch/$arch
CONF
sudo pacman -Syu navibeat
