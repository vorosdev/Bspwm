#!/usr/bin/env bash
  
DIR="$HOME/.config/polybar"
# Terminate already running bar instances
killall -q polybar

## Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

## Launch

polybar -q powermenu -c "$DIR"/config.ini &
polybar -q workspace -c "$DIR"/config.ini &
polybar -q center_bar -c "$DIR"/config.ini &
polybar -q right_bar -c "$DIR"/config.ini &


