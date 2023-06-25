#!/bin/bash

MONITOR=HEAD-1 # xrandr | grep ' connected' | grep HDMI | awk '{print $1}'
STYLUS="HID 256c:006d stylus"

xsetwacom set "$STYLUS" MapToOutput $MONITOR
