#!/bin/bash

ports=($(xrandr | grep ' connected' | awk '{print $1}'))

if [[ ${#ports[@]} -lt 2 ]]; then
  echo "Only one monitor, skipped"
  exit 0
fi

for port in ${ports[@]};
do
  if [[ $port == DVI* ]]; then
    dell=$port
  fi
  if [[ $port == DP* ]]; then
    benq=$port
  fi
  if [[ $port == HDMI* ]]; then
    huion=$port
  fi
done

if [[ -z "$dell" ]]; then
  exit 0
fi

cmd="xrandr --output $dell --primary"

if ! [[ -z "$benq" ]]; then
  cmd="$cmd --output $benq --right-of $dell"
fi
 
if ! [[ -z "$huion" ]]; then
  cmd="$cmd --output $huion --right-of $benq"
fi
 
$cmd
