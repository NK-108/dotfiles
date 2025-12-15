#!/usr/bin/env bash

# Get Active Workspaces
WS=$(hyprctl activeworkspace -j | jq '.id')

COUNT=$(hyprctl clients -j | jq "[.[] | select(.workspace.id == $WS)] | length")

if [ $COUNT -gt 0 ] ; then
  pkill -SIGUSR2 waybar
else
  pkill -SIGUSR1 waybar
fi
