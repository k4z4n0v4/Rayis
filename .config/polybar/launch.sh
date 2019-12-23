#!/usr/bin/env bash


# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
echo "---" > /tmp/polybar


MONITOR="VGA-0" polybar --reload top >>/tmp/polybar &
MONITOR="VGA-0" polybar --reload bot>>/tmp/polybar &
MONITOR="DVI-I-1" polybar --reload bot>>/tmp/polybar &

echo "Bars launched..."
