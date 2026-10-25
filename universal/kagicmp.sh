#!/usr/bin/env bash

if [ ! -d ~/Projects ]; then
    mkdir -p ~/Projects
fi

cd ~/Projects &&
	git clone https://github.com/kagisearch/kagimcp.git &&
	cd kagicmp &&
	uv sync
