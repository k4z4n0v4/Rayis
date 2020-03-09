#!/bin/bash 

accept=$(echo -ne "Confirm\nCancel" | dmenu -p "Confirm WM Termination:")

if [ "$accept" == "Confirm" ]; then
	i3-msg exit
fi
