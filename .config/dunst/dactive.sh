#!/usr/bin/dash

active=$(dunstctl is-paused)
if [ "$1" = "swap" ] ; then
	dunstctl set-paused toggle
else

	output=""
	if [ "$active" = "true" ] ; then
		output="  󰖰"
	else
		output="  󰖯"
	fi

	printf ${output}
fi 

