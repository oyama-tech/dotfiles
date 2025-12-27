#!/usr/bin/env bash

choice=$(printf "  Lock\n󰤄  Suspend\n󰍃  Logout\n󰜉  Reboot\n  Shutdown" \
  | wofi --dmenu --prompt "Power")

case "$choice" in
  *Lock)
    hyprlock
    ;;
  *Suspend)
    hyprlock && systemctl suspend
    ;;
  *Logout)
    hyprctl dispatch exit
    ;;
  *Reboot)
    systemctl reboot
    ;;
  *Shutdown)
    systemctl poweroff
    ;;
esac
