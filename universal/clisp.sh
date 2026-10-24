#!/usr/bin/env bash

if ! command -v sbcl &> /dev/null
then
    echo "sbcl is not installed. Please install sbcl first."
    exit 1
fi

sbcl --load /usr/share/quicklisp/quicklisp.lisp \
	--eval '(quicklisp-quickstart:install)' \
	--eval '(ql:add-to-init-file)' \
	--quit
