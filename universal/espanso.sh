#!/usr/bin/env bash

if ! command -v espanso &> /dev/null
then
    echo "espanso is not installed. Please install espanso first."
    exit 1
fi

espanso service register
espanso start
