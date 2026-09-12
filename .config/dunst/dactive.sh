#!/bin/bash

active=$(dunstctl is-paused)

if [ "$1" = "swap" ]; then
    dunstctl set-paused toggle
    exit 0
fi

if [ "$active" = "true" ]; then
    printf "  󰖰"
else
    printf "  󰖯"
fi
