#!/usr/bin/env bash
if not command -v cargo-binstall >/dev/null 2>&1; then
	curl -L --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh | bash &&
		cargo binstall yazi --no-confirm
fi

cargo binstall yazi-fm yazi-cli
../yazi.sh
