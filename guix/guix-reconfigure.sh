#!/usr/bin/env bash
guix pull &&
    sudo guix system reconfigure ~/.config/guix/system.scm
