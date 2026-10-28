#!/usr/bin/env bash

if ! command -v rustup &>/dev/null; then
	echo "rustup is not installed. Please install rustup first."
	exit 1
fi

rustup default stable &&
	rustup component add rust-analyzer rustfmt rust-src clippy &&
	cargo install cargo-seek
