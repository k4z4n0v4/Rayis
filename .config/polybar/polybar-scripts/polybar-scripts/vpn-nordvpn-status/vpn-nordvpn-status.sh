#!/bin/sh

STATUS=$(protonvpn status | grep Status | tr -d ' ' | cut -d ':' -f2)

if [ "$STATUS" = "Connected" ]; then
    echo "%{F#82E0AA}%{A1:protonvpn d:}$(protonvpn status | grep Country | cut -d ':' -f2)%{A}%{F-}"
else
    echo "%{F#f00}%{A1:protonvpn c:}no vpn%{A}%{F-}"
fi
