#!/usr/bin/env bash
sudo stow -t $HOME/.config/systemd/user/ .services/ --restow --verbose
