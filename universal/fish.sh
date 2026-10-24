#!/usr/bin/env bash

if ! command -v fish &> /dev/null
then
    echo "fish is not installed. Please install fish first."
    exit 1
fi

fish -c "fisher install jorgebucaran/fisher"
