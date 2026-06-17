#!/bin/bash
entries=('Reload' 'Logout' 'Suspend' 'Reboot' 'Shutdown')

selected=$(printf '%s\n' ${entries[@]} | dmenu -i -p 'Power options' -fn 'Inconsolata Nerd Font Mono-16')

case $selected in
	Reload) _pkill sxhkd && sxhkd ;;
	Logout) _pkill -u $USER ;;
	Suspend) systemctl suspend ;;
	Reboot) systemctl reboot ;;
	Shutdown) systemctl shutdown ;;
esac  
