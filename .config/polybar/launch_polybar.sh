#!/bin/bash

#Terminate running instances
pkill polybar

#launch Polybar using default ~.config/polybar/config.ini
polybar mybar

echo "Polybar launched..."
