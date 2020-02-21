#!/bin/sh

IFACE=$(ifconfig | grep proton | awk '{print $1}')

if [ "$IFACE" = "proton*" ]; then
    echo "#1 %{u#55aa55}$(ifconfig proton0 | grep inet | awk '{print $2}' | cut -f2 -d ':')%{u-}"
else
    echo "#1 %{F#FF0000}%{u#FF0000}VPN DISCONNECTED%{u-}%{F-}"
fi
