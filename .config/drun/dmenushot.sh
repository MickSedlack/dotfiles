#!/bin/bash

entries=("Snip" "Window" "Printscreen" "Clipboard")

selected=$(printf '%s\n' ${entries[@]} | dmenu -i -l 4 -fn 'Cozettevector-16')

case $selected in
	S*) 
	maim -s | xclip -selection clipboard -t image/png;;
#	xdotool getactivewindow >> ~/Pictures/test.txt
	W*)
	maim -i $(xdotool getactivewindow) | xclip -selection clipboard -t image/png;;
	P*)
	maim ~/Pictures/screenshots/$(date +%A%-%R%-%S).png;;
	C*)
	maim | xclip -selection clipboard -t image/png;;			
esac
