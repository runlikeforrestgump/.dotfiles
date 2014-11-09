#!/usr/bin/env bash 

set -e

stately() {
    while read line; do
        case "$line" in
            LOCK*) killall -SIGUSR1 dunst ;;
            UNBLANK*) killall -SIGUSR2 dunst ;;
        esac
    done
}

xscreensaver-command -watch | stately
