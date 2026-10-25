#!/usr/bin/env bash

if ! command -v wikiman &> /dev/null
then
    echo "wikiman is not installed. Please install wikiman first."
    exit 1
fi

curl -L 'https://raw.githubusercontent.com/filiparag/wikiman/master/Makefile' -o 'wikiman-makefile' &&
    if grep -q '^ID=arch' /etc/os-release; then
	make -f ./wikiman-makefile source-arch
    else
	echo 'Not an Arch Linux system. Skipping source-arch.'
    fi &&
    make -f ./wikiman-makefile source-tldr &&
    sudo make -f ./wikiman-makefile source-install &&
    sudo make -f ./wikiman-makefile clean

if [ -d srcbuild ]; then
	rm -rf srcbuild
fi
if [ -f wikiman-makefile ]; then
	rm wikiman-makefile
fi
