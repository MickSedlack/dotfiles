#!/usr/bin/bash
#
#
# Takes up, down, and mute as args.
# This version is pulseaudio/pipewire
# Alongside pamixer
#
# This little script stands on these shoulders:
# https://github.com/dastorm/volume-notification-dunst/blob/master/volume.sh
# https://gist.github.com/sebastiencs/5d7227f388d93374cebdf72e783fbd6a
# https://gist.github.com/Blaradox/030f06d165a82583ae817ee954438f2e
# https://holmdev.github.io/articles/creating-a-volume-display-script/

case $1 in
  up)
    wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
    dunstify "Volume: $(printf "%03d%%" $(pamixer --get-volume))" \
	    -i audio-volume-high \
	    -r 22328 \
	    -h int:value:$(pamixer --get-volume)
    ;;
  down)
    wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
    dunstify  "Volume: $(printf "%03d%%" $(pamixer --get-volume))" \
	    -i audio-volume-low \
	    -r 22328 \
	    -h int:value:$(pamixer --get-volume)
    ;;
  mute)
    # toggle mute
    wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
    dunstify "Volume: $(printf $(pamixer --get-volume-human))" -i audio-volume-muted -r 22328
    ;;
esac
