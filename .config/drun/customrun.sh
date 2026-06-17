#!/usr/bin/bash

case $1 in
	1) 
	i3-dmenu-desktop --dmenu "dmenu -i -p '♥' -fn 'Inconsolata Nerd Font Mono-16'";;
	2)
	dmenu_run -i -p '♥' -fn 'Inconsolata Nerd Font Mono-16';;
esac`
