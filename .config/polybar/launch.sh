#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

## Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

## Launch

## Left bar
polybar powermenu -c ~/.config/polybar/current.ini &
polybar workspace -c ~/.config/polybar/workspace.ini &

## Center bar
polybar hackthebox -c ~/.config/polybar/current.ini &
polybar target -c ~/.config/polybar/current.ini &
polybar ethernet -c ~/.config/polybar/current.ini &\

## Right bar
polybar right_bar -c ~/.config/polybar/current.ini &
polybar audio -c ~/.config/polybar/current.ini &
