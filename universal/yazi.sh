#!/usr/bin/env bash

if ! command -v yazi &> /dev/null
then
    echo "Emacs is not installed. Please install Emacs first."
    exit 1
fi
# Add yazi plugins
ya pkg add yazi-rs/flavors:dracula
ya pkg add yazi-rs/plugins:smart-enter
ya pkg add yazi-rs/plugins:mount
ya pkg add yazi-rs/plugins:chmod
ya pkg add yazi-rs/plugins:full-border
ya pkg add yazi-rs/plugins:git
ya pkg add yazi-rs/plugins:jump-to-char
ya pkg add yazi-rs/plugins:vcs-files
ya pkg add yazi-rs/plugins:piper
