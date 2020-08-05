#!/usr/bin/env bash


# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log


#if type "xrandr"; then
#  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#    MONITOR=$m polybar --reload top >>/tmp/polybar1 &
#    MONITOR=$m polybar --reload bot >>/tmp/polybar2 &
#  done
#else
#    polybar --reload top >>/tmp/polybar1 &
#    polybar --reload bot >>/tmp/polybar2 &
#fi
MONITOR="HDMI1" polybar --reload top >> /tmp/polybar1.log 2>&1 &
#MONITOR="HDMI1" polybar --reload bot >>/tmp/polybar2 &
MONITOR="DP1" polybar --reload bot >> /tmp/polybar2.log 2>&1 &


echo "Bars launched..."
