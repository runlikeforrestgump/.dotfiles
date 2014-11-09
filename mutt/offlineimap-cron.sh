#!/usr/bin/env bash

ps -e | grep "[o]fflineimap"
if [ $? -eq "0" ]; then
    exit 1
else
    ps -e | grep "[m]utt"
    if [ $? -eq "0" ]; then
        offlineimap -u quiet
    fi
fi
