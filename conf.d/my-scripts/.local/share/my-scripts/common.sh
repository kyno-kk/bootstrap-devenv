#!/usr/bin/env bash

msg()  { printf "\n\033[1;32m==>\033[0m %s\n" "$*"; }
log()  { printf "%s\n" "$*"; }
warn() { printf "\033[1;33mWARN:\033[0m %s\n" "$*" >&2; }
fail() { printf "\033[1;31mERROR:\033[0m %s\n" "$*" >&2 || true; }
die()  { fail "$@"; exit 1; }

write_once() {
    if [ -z "${1:-}" ] || [ -z "${2:-}" ]; then
        fail "Must call with two arguments."
        return 1
    fi

    touch "$2"
    grep -qxF -- "$1" "$2" 2>/dev/null || echo "$1" >> "$2"
}
