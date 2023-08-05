#!/bin/sh

BLANK='#00000000'
CLEAR='#ffffff22'
DEFAULT='#e5b8d5'
TEXT='#81c6d6'
WRONG='#a4eebb'
VERIFYING='#cbe990'

i3lock \
--insidever-color=$CLEAR     \
--ringver-color=$VERIFYING   \
\
--insidewrong-color=$CLEAR   \
--ringwrong-color=$WRONG     \
\
--inside-color=$BLANK        \
--ring-color=$DEFAULT        \
--line-color=$BLANK          \
--separator-color=$DEFAULT   \
\
--verif-color=$TEXT          \
--wrong-color=$TEXT          \
--time-color=$TEXT           \
--date-color=$TEXT           \
--layout-color=$TEXT         \
--keyhl-color=$WRONG         \
--bshl-color=$WRONG          \
\
--screen 1                   \
--blur 1                     \
--clock                      \
--indicator                  \
--time-str="%H:%M:%S"        \
--date-str="%A, %d-%m-%Y"    \
--keylayout 1                \
-i ~/Pictures/Wallpapers/Anime/lucy.png   \
