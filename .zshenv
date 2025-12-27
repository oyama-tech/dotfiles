# Fix TERM for Ghostty / Kitty (FreeBSD / TrueNAS compatibility)
case "$TERM" in
  xterm-ghostty|xterm-kitty)
    export TERM=xterm-256color
    ;;
esac
