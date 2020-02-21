#!/bin/sh

IFACE=$(ifconfig | grep proton | awk '{print $1}')

if [ "$IFACE" = "proton0:" ]; then
    echo "%{u#55aa55} VPN: $(protonvpn s | grep Country | cut -b '15-' )%{u-}"
else
    echo "%{F#FF0000}%{u#FF0000}VPN DISCONNECTED%{u-}%{F-}"
fi
