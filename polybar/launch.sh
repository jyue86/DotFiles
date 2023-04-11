#!/usr/bin/env bash
# https://www.reddit.com/r/Polybar/comments/mg1ube/trying_to_setup_polybar_using_two_monitors/

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

for m in $(polybar --list-monitors | cut -d":" -f1); do
    echo $m
    MONITOR=$m polybar --reload main &
    echo $MONITOR
done
