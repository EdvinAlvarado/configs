#!/usr/bin/env bash

if ! { command -v meson && command -v ninja; } &>/dev/null; then
	echo "FAILED: stclib. REQUIRED: meson, ninja"
	exit 1
fi

git clone --branch "v5.0" https://github.com/stclib/STC.git &&
	cd STC &&
	meson setup --buildtype debug build --prefix ~/.local &&
	cd build &&
	ninja &&
	ninja install &&
	cd ../.. &&
	rm -rf STC
