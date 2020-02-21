#!/bin/bash

archupdates=$(checkupdates | awk {'print $1'})
aurupdates=$(pakku -Qum | awk {'print $1'})


notify-send "Updates Available:" "Arch: $archupdates\nAUR: $aurupdates"
