#!/bin/sh

#IFACE=$(ifconfig | grep proton | awk '{print $1}')
IFACE="proton0"

ifconfig | grep proton >/dev/null &&   echo "%{u#55aa55} VPN: $(protonvpn s | grep Country | cut -b '15-' )%{u-}" || echo "%{F#FF0000}%{u#FF0000}VPN DISCONNECTED%{u-}%{F-}"
