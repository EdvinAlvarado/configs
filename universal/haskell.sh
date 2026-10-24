#!/usr/bin/env bash

if ! command -v ghcup &> /dev/null
then
    echo "ghcup is not installed. Please install ghcup first."
    exit 1
fi

ghcup install ghc &&
ghcup install cabal &&
ghcup install hls &&
ghcup install stack &&
ghcup install ShellCheck &&
cabal install fast-tags
