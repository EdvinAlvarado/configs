#!/usr/bin/env bash

# Default values
force=false

# Parse command-line arguments
while [[ "$#" -gt 0 ]]; do
    case "$1" in
        --force)
            force=true
            shift
            ;;  
        *)
            echo "Unknown option: $1"
            exit 1
            ;;  
    esac
done

if [[ "$force" == true ]]; then
    echo "Warning: Using --force will overwrite existing files. Proceed? (y/n)"
    read -r confirmation
    if [[ "$confirmation" == "y" ]]; then
        stow -t $HOME --adopt .dotfiles/ && git restore .
        if string match -q -r '^ID=guix' < /etc/os-release; then
            stow -t $HOME --adopt .guix/ && git restore .
        fi
    else
        echo "Operation canceled."
    fi
else
    stow -t $HOME .dotfiles/
    if string match -q -r '^ID=guix' < /etc/os-release; then
        stow -t $HOME .guix/
    fi
fi
