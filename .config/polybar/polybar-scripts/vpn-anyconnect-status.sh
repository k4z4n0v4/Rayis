#!/bin/sh

#IFACE=$(ifconfig | grep proton | awk '{print $1}')
IFACE="tun0"

ifconfig | grep tun0 >/dev/null &&   echo "%{u#55aa55}%{A1:vpn_switch:}%{A3:sudo systemctl stop openvpn-client@mullvad:}VPN: $(curl -s ifconfig.io/country_code)%{A}%{A}%{u-}" || echo "%{F#FF0000}%{u#FF0000}%{A1: vpn_switch:}VPN DISCONNECTED%{A}%{u-}%{F-}"
