#!/usr/bin/env bash

if ! command -v tldr &> /dev/null
then
    echo "tldr is not installed. Please install tldr first."
    exit 1
fi

tldr --update
