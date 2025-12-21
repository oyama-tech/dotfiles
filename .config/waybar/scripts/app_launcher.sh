#!/bin/bash

choice=$(printf "Firefox\nTerminal\nFiles\nVSCode\n" | wofi --dmenu)

case "$choice" in
  Firefox) firefox ;;
  Terminal) ghostty ;;
  Files) thunar ;;
  VSCode) code ;;
esac
